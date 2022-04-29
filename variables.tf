variable "region" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}
variable "s3-tags" {
  type        = map(any)
  description = "Tag names"
  default = {
    Name = "App bucket"
  }
}
variable "bucket-acl" {
  type        = string
  default     = "private"
  description = <<-EOT
    The [canned ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl) to apply.
    We recommend `private` to avoid exposing sensitive information. Conflicts with `grants`.
    EOT
}
variable "versioning" {
  type        = string
  description = "(Optional) State of versionaing"
  default     = "Disabled"
}
variable "sse_algorithm" {
  type        = string
  default     = "AES256"
  description = "The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`"
}

# Inputs
variable "s3-bucket-name" {
  type        = string
  description = "Name of the s3 bucket"
}
variable "block-public-acls" {
  type    = bool
  default = false
}
variable "block-public-policy" {
  type    = bool
  default = false
}
variable "ignore-public-acls" {
  type    = bool
  default = false
}
variable "restrict-public-buckets" {
  type    = bool
  default = false
}