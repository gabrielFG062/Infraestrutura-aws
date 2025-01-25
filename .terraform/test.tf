provider "aws" {
    region = "us-east-1"
    acl = "private"
}
variable "bucket_name" {
    type = string
  
}

resource "aws_s3_bucket" "bucket_s3" {
    bucket = "bucket_s3_com_politica"
    tags = {
      Name = "my bucket_s3_com_politica"
      environment = "Dev"
    }
}
resource "aws_s3_bucket_policy" "my_policy" {
    bucket = aws_s3_bucket_policy.my_policy.id
    policy = jsondecode({
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
            "s3:GetObject"
          ],
          "Resource": [
            "arn:aws:s3:::my_policy/*"
          ]
        }
      ]
    })
}
