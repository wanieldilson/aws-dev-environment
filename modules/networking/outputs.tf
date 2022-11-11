output "security_group_id" {
  value = aws_security_group.allow_ingress.id
}

output "subnet_id" {
  value = aws_subnet.this.id
}