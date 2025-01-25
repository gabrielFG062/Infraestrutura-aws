# plugin que da acesso a recursos que podera utilizar 
provider "aws" { 
# regiao quea nuvem utilizara 
    region = "us-east-1"
}
# nome da variavel que sera utilizado
variable "bucket_name" {
  type = string
}
variable "instance_types" {
  type = map 
  default = {
    "dev" = "t2.micro"
    "prod" = "t2.large"
  }
  

}

# objetos de infraestura
resource "aws_s3_bucket" "static_site" {
 # facilidade na hora de fazer a busca no site
    bucket ="static-site-${var.bucket_name}" 
}

# formula pra estimular se o website vai dar erro ou nao
# resource "aws_s3_bucket_website_configuration" "static_site" {
#     bucket = aws_s3_bucket.static_site.id
#     index_document {
#         suffix = "index.html"
#     }
#     error_document {
#       key = "error.html"
#     }
    tags = {
        Name = "static site"
        Enviorament = "produçao"
    }
#  }
    website = {
        index_document = "index.html"
        error_document = "error.html"
    }
 resource "aws_s3_bucket_public_access_block" "static_site" {
    bucket = aws_s3_bucket.static_site.id 
    
   
 }
    




