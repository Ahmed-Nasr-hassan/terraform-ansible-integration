variable "s3-bucket-name" {

}

variable "versioning-status" {
  default = "Enabled"
}
variable "dynamodb-table-name" {
  default ="terraform-up-and-running-locks"
}
variable "dynamodb-billing-mode" {
  default = "PAY_PER_REQUEST"
}
variable "dynamodb-hash-key" {
  default = "LockID" 
}
variable "string-attribute" {
  default = "S"
}
