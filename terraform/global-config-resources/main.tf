resource "aws_s3_bucket" "terraform-state" {
    bucket = var.s3-bucket-name
    lifecycle {
      prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "s3-enable-versioning" {
  bucket = var.s3-bucket-name
  versioning_configuration {
    status =var.versioning-status
  }
}

resource "aws_dynamodb_table" "terraform-lock-table" {
  name = var.dynamodb-table-name
  billing_mode = var.dynamodb-billing-mode
  hash_key = var.dynamodb-hash-key
  attribute {
    name = var.dynamodb-hash-key
    type = var.string-attribute
  }

}