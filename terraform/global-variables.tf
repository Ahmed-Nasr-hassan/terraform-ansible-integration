variable "selected-region" {
  
}
variable "s3-bucket-name" {
  
}
variable "dynamodb-table-name" {
  
}
variable "bucket-key" {
  
}
# vpc variables
variable "vpc_cidr_block" {
  description = "vpc cidr block string ex. 10.0.0.0/16"
  type = string
}

variable "subnet_cidr_blocks" {
  description = "subnet cidr block map ex. {cidr1=10.0.0.0/24,10.0.2.0/24}"
  type = map
}

variable "public-subnet-key-to-nat" {
  
}

variable "keys-of-public-subnets" {
  type = list
}

variable "keys-of-private-subnets" {
  type = list
}

variable "subnet_types" {
  type = map
}

# ec2 variables

variable "key-name" {
  
}

variable "path-to-pem-file" {
  
}


# lb variables

variable "lb_name" {
  
}

variable "target_group_name" {
  
}

variable "target_group_type" {
  
}

