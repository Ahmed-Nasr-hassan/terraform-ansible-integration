resource "aws_security_group" "nasrsg" {
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id = var.vpc_id

  ingress {
    description      = "SSH from Anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.allow_all_ipv4_cidr_blocks]
    ipv6_cidr_blocks = [var.allow_all_ipv6_cidr_blocks]
  }

    ingress {
    description      = "SSH from Anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.allow_all_ipv4_cidr_blocks]
    ipv6_cidr_blocks = [var.allow_all_ipv6_cidr_blocks]
  }

  ingress {
    description      = "HTTP from Anywhere"
    from_port        = 8081
    to_port          = 8081
    protocol         = "tcp"
    cidr_blocks      = [var.allow_all_ipv4_cidr_blocks]
    ipv6_cidr_blocks = [var.allow_all_ipv6_cidr_blocks]
  }

    ingress {
    description      = "HTTP from Anywhere"
    from_port        = 9000
    to_port          = 9000
    protocol         = "tcp"
    cidr_blocks      = [var.allow_all_ipv4_cidr_blocks]
    ipv6_cidr_blocks = [var.allow_all_ipv6_cidr_blocks]
  }

      ingress {
    description      = "HTTP from Anywhere"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = [var.allow_all_ipv4_cidr_blocks]
    ipv6_cidr_blocks = [var.allow_all_ipv6_cidr_blocks]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.allow_all_ipv4_cidr_blocks]
    ipv6_cidr_blocks = [var.allow_all_ipv6_cidr_blocks]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}

resource "aws_instance" "nasr-ec2" {
  ami = var.ec2-ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = var.is_public
  vpc_security_group_ids = [aws_security_group.nasrsg.id]
  key_name = var.key-name

  provisioner "local-exec" {
    command = var.is_public ? "echo public-ip-${var.item-count} ${self.public_ip} >> all-ips.txt" : "echo private-ip$-${var.item-count} ${self.private_ip} >> all-ips.txt"
  }
}
