output "ubuntu_id" {
  value = data.aws_ami.ubuntu.id
}

output "amazon_linux_id" {
  value = data.aws_ami.amazon-linux.id
}