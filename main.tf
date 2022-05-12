terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.13.0"
    }
  }

  required_version = ">=0.14.9"

  backend "s3" {
    region = "us-east-1"
    bucket = aws_s3_bucket.this.name
    key    = aws_s3_bucket.this.key
  }


}
