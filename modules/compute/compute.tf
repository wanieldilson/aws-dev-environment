resource "aws_key_pair" "dev-env-key" {
  key_name   = "devInstanceKey"
  public_key = file("/mnt/workspace/devInstanceKey.pub")
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.dev-env-key.id
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id
  user_data              = file("${path.module}/user_data.tpl")

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "dev-instance"
  }
}