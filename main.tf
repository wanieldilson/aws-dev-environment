module "networking" {
  source   = "./modules/networking"
  local_ip = var.local_ip

}

module "compute" {
  source               = "./modules/compute"
  security_group_id    = module.networking.security_group_id
  subnet_id            = module.networking.subnet_id
  key_name             = "devInstanceKey"
  developer_name       = "wanieldilson"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.terraform_profile.name
}

