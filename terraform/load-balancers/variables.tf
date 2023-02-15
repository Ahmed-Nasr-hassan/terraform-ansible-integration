variable "vpc_id" {

}

variable "lb_name" {
  
}

variable "is_lb_internal" {
  
}

variable "lb_subnets_ids" {
  
}

variable "ec2_instance_ids" {

}

variable "target_group_name" {
  
}

variable "target_group_type" {
  
}

variable "allow_all_ipv4_cidr_blocks" {
  type = string
  default = "0.0.0.0/0"
}

variable "allow_all_ipv6_cidr_blocks" {
  type = string
  default = "::/0"
}