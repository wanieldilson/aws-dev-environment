resource "aws_key_pair" "dev-env-key" {
  key_name   = var.key_name
  public_key = file("/mnt/workspace/devInstanceKey.pub")
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.dev-env-key.id
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id
  user_data              = file("${path.module}/user_data.tpl")
  iam_instance_profile   = var.iam_instance_profile

  root_block_device {
    volume_size = 10
  }

  tags = {

    Name = "${var.developer_name}-dev-instance"
  }
}