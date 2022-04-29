#######################
# Create s3 bucket
#######################
resource "aws_s3_bucket" "this" {
  bucket = var.s3-bucket-name
  tags   = var.s3-tags

  force_destroy = true
}
#######################
# Create bucket ACL
#######################
resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.this.id
  acl    = var.bucket-acl
}
#######################
# Block public access
#######################
resource "aws_s3_bucket_public_access_block" "s3-block-access" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
#######################
# Bucket versioning
#######################
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning
  }
}
#######################
# Server side encryption
#######################
resource "aws_s3_bucket_server_side_encryption_configuration" "s3-encryption" {
  bucket = aws_s3_bucket.this.bucket
  rule {
    apply_server_side_encryption_by_default {
      # kms_master_key_id = var.kms_master_key_arn
      sse_algorithm = var.sse_algorithm
    }
  }
}
#######################
# Website configuration
#######################
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.this.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }

}
#######################
# Bucket policy
#######################
resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.s3-read-only.json
}
