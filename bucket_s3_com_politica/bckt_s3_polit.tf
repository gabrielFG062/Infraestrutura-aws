# provedor aws
provider "aws" {
    region = "us-east-1"
# nome unico globalmente
    bucket = "my-tf-test-bucket"
# permissoes do bucket
    acl = "private"
}
# bucket s3
resource "aws_s3_bucket" "bucket_s3" {
    bucket = "my-tf-test-bucket"
    tags = {
      Name = "my bucket s3"
      environment = "dev"
    }
}
# politica do bucket
resource "aws_s3_bucket_policy" "my_policy" {
  bucket = aws_s3_bucket.my_policy.id
  policy = jsondecode({
    Version = "2012-10-17",
    Statement = [
        {
            Sid=  "PublicReadGetObject",
            Effect = "Allow",
            Principal = "*",
            Action = "s3:GetObject"
            Resource ="arn:aws:s3:::my-tf-test-bucket/*"
        }
    ]
  })

}