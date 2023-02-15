module "creating-vpc-components" {
  source = "./vpc-components"
  vpc_cidr_block = var.vpc_cidr_block
  subnet_cidr_blocks = var.subnet_cidr_blocks
  public-subnet-key-to-nat = var.public-subnet-key-to-nat
  keys-of-public-subnets = var.keys-of-public-subnets
  keys-of-private-subnets = var.keys-of-private-subnets
  subnet_types =  var.subnet_types
}

module "creating-private-ec2-instances" {
  source = "./ec2-instances-config"
  vpc_id = module.creating-vpc-components.nasr-vpc-id
  subnet_id = module.creating-vpc-components.private_subnet_ids[count.index]
  count = length(module.creating-vpc-components.private_subnet_ids)
  key-name = var.key-name
  path-to-pem-file = var.path-to-pem-file
  is_public = false
  item-count = count.index + 1
  bastion_host_ip = module.creating-public-ec2-instances.public_ip
  ec2-ami = [module.initialize_aws_ami.amazon_linux_id,module.initialize_aws_ami.ubuntu_id][count.index]
  instance_type = "t2.medium"
}


module "initialize_aws_ami" {
  source = "./ec2-ami"
}

module "creating-public-ec2-instances" {
  source = "./ec2-instances-config"
  vpc_id = module.creating-vpc-components.nasr-vpc-id
  subnet_id = module.creating-vpc-components.public_subnet_ids[0]
  key-name = var.key-name
  path-to-pem-file = var.path-to-pem-file
  is_public = true
}

module "creating-public-load-balancer" {
  source = "./load-balancers"
  vpc_id = module.creating-vpc-components.nasr-vpc-id
  lb_name = var.lb_name
  lb_subnets_ids = module.creating-vpc-components.public_subnet_ids
  is_lb_internal = false
  target_group_name = var.target_group_name
  target_group_type = var.target_group_type
  ec2_instance_ids = module.creating-public-ec2-instances[*].instances_ids
}