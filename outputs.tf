output "dev-instance-ip" {
    value = aws_instance.this.public_ip
}