output "instances_ids" {
  value = aws_instance.nasr-ec2.*.id
}

output "public_ip" {
  value = aws_instance.nasr-ec2.public_ip
}