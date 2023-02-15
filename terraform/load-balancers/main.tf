resource "aws_alb" "load_balancer_template" {
  name               = var.lb_name
  internal           = var.is_lb_internal
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.lb_subnets_ids
}

resource "aws_alb_listener" "lb_listener" {
  load_balancer_arn = aws_alb.load_balancer_template.arn
  port             = "80"
  protocol         = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hello from default load balancer page"
      status_code  = "200"
    }
  }
}

resource "aws_alb_target_group" "lb_target_group" {
  name       = var.target_group_name
  port       = 80
  protocol   = "HTTP"
  vpc_id     = var.vpc_id
  target_type = var.target_group_type
  count = length(flatten(var.ec2_instance_ids))
}

resource "aws_alb_target_group_attachment" "attach_target_group" {
  target_group_arn = aws_alb_target_group.lb_target_group[count.index].arn
  count = length(flatten(var.ec2_instance_ids))
  # target_id = element(var.ec2_instance_ids, count.index)
  target_id = flatten(var.ec2_instance_ids)[count.index]
  port = 80
}

resource "aws_security_group" "lb_sg" {
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
    description      = "HTTP from Anywhere"
    from_port        = 80
    to_port          = 80
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