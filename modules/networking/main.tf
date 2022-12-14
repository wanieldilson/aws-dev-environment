resource "aws_vpc" "this" {
  cidr_block = "10.69.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    name = "Dev"

  }
}

resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"

  tags = {

    name = "dev-public"

  }

}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "dev-public-rtb"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}

resource "aws_security_group" "allow_ingress" {
  name        = "dev-sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "Traffic from local IP"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.local_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
