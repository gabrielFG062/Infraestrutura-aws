module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    cidr_block = "89.207.132.170/16"
    environment = "dev"
}
module "ec2" {
    source = "../modules/ec2"

    instance_type = "t2.micro"
    key_name = "test"
    subnet_id = module.vpc.public_subnets_id
    # vpc_id = module.vpc.vpc_id
}

terraform {
    backend "s3" {
      bucket = "test-terraform-state"
      key = "test.tfstate"
      region = "us-east-1"
      dynamodb_table = "test-terraform-state-lock"
      encrypt = true
      
    }
}
