variable "vpc_id" {

}

variable "subnet_id" {
  
}

variable "ec2-ami" {
  default = ""
}


variable "is_public" {

}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "allow_all_ipv4_cidr_blocks" {
  type = string
  default = "0.0.0.0/0"
}

variable "allow_all_ipv6_cidr_blocks" {
  type = string
  default = "::/0"
}

variable "key-name" {
  
}

variable "path-to-pem-file" {
  
}

variable "item-count" {
  default = 1
}

variable "my-remote-commands" {
  default = []
}

variable "bastion_host_ip" {
  default = ""
}
