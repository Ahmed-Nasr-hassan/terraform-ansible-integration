output "lb-dns" {
  value = aws_alb.load_balancer_template.dns_name
}