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
  name               = "terraform-admin"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json

  inline_policy {
    name   = "administrator-access"
    policy = data.aws_iam_policy_document.inline_policy.json
  }

}

resource "aws_iam_instance_profile" "terraform_profile" {
  name = "terraform-profile"
  role = aws_iam_role.terraform-admin.name
}