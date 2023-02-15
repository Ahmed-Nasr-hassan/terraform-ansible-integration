resource "aws_vpc" "nasr-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        "Name" : "terraform-vpc-lab3"
    }
}

resource "aws_subnet" "nasr-subnet" {
    vpc_id = aws_vpc.nasr-vpc.id
    for_each = var.subnet_cidr_blocks
    cidr_block = each.key
    availability_zone = each.value # or create another map with same keys and use each.key as argument 
    tags = {
        Type = var.subnet_types[each.key]
    }
}

resource "aws_internet_gateway" "nasr-gateway" {
    vpc_id = aws_vpc.nasr-vpc.id
}

resource "aws_eip" "nasr-eip" {
  vpc = true
}

resource "aws_nat_gateway" "nasr-nat-gtw" {
  subnet_id     = aws_subnet.nasr-subnet[var.public-subnet-key-to-nat].id
  allocation_id = aws_eip.nasr-eip.id
}

resource "aws_route_table" "nasr-route-table-public" {
    vpc_id = aws_vpc.nasr-vpc.id
    
  route {
    cidr_block = var.allow_all_ipv4_cidr_blocks
    gateway_id = aws_internet_gateway.nasr-gateway.id
  }

  route {
    ipv6_cidr_block        = var.allow_all_ipv6_cidr_blocks
    gateway_id = aws_internet_gateway.nasr-gateway.id
  }

}

resource "aws_route_table" "nasr-route-table-private" {
    vpc_id = aws_vpc.nasr-vpc.id
    
  route {
    cidr_block = var.allow_all_ipv4_cidr_blocks
    gateway_id = aws_nat_gateway.nasr-nat-gtw.id
  }
}

resource "aws_route_table_association" "rt-associate-public" {
  subnet_id      = aws_subnet.nasr-subnet[each.value].id
  route_table_id = aws_route_table.nasr-route-table-public.id
  for_each = toset(var.keys-of-public-subnets)
}

resource "aws_route_table_association" "rt-associate-private" {
  subnet_id      = aws_subnet.nasr-subnet[each.value].id
  route_table_id = aws_route_table.nasr-route-table-private.id
  for_each = toset(var.keys-of-private-subnets)
}