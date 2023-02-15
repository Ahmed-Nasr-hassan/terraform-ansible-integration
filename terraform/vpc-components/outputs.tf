output "nasr-vpc-id" {
  value = aws_vpc.nasr-vpc.id
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.nasr-subnet : subnet.id if subnet.tags.Type == "public"]
}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.nasr-subnet : subnet.id if subnet.tags.Type == "private"]
}