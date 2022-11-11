output "dev-instance-ip" {
  value = aws_instance.this.public_ip
}

output "connection_script" {
  value = templatefile("${var.host_os}-ssh-config.tpl", {
    hostname = aws_instance.this.public_ip,
    user     = "ubuntu",
  identityfile = "~/.ssh/devInstanceKey" })

}