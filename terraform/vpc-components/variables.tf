variable "vpc_cidr_block" {
  description = "vpc cidr block string ex. 10.0.0.0/16"
  type = string
}

variable "subnet_cidr_blocks" {
  description = "subnet cidr block map ex. {cidr1=10.0.0.0/24,10.0.2.0/24}"
  type = map
}

variable "allow_all_ipv4_cidr_blocks" {
  type = string
  default = "0.0.0.0/0"
}

variable "allow_all_ipv6_cidr_blocks" {
  type = string
  default = "::/0"
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

