# set global variables
selected-region = "us-east-1"
s3-bucket-name = "nasr-terraform-state-file"
dynamodb-table-name = "terraform-state-lock-tracker"
bucket-key = "dev/terraform.tfstate"

# set vpc components variables

vpc_cidr_block = "10.0.0.0/16"
subnet_cidr_blocks = {
      "10.0.0.0/24"="us-east-1a",
      "10.0.2.0/24"="us-east-1b",
      "10.0.1.0/24"="us-east-1a",
      "10.0.3.0/24"="us-east-1b",
}
subnet_types = {
      "10.0.0.0/24"="public",
      "10.0.2.0/24"="public",
      "10.0.1.0/24"="private",
      "10.0.3.0/24"="private",
}
public-subnet-key-to-nat = "10.0.0.0/24"
keys-of-public-subnets = ["10.0.0.0/24","10.0.2.0/24"]
keys-of-private-subnets = ["10.0.1.0/24","10.0.3.0/24"]

# set ec2 variables

key-name = "my-key"
path-to-pem-file = "./my-key.pem"

# set load balancer variables

lb_name = "nasr-alb"
target_group_name = "nasr-target-group"
target_group_type = "instance"
