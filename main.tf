module "networking" {
  source   = "./modules/networking"
  local_ip = var.local_ip

}

module "compute" {
  source            = "./modules/compute"
  security_group_id = module.networking.security_group_id
  subnet_id         = module.networking.subnet_id
  key_name          = "devInstanceKey"
  developer_name    = "wanieldilson"
  instance_type     = "t2.micro"
}

data "aws_iam_policy_document" "inline_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "terraform-admin" {
  name = "terraform-admin"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json

  inline_policy {
    name = "administrator-access"
    policy = data.aws_iam_policy_document.inline_policy.json
  }

}
