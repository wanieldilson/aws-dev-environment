variable "subnet_id" {
  type        = string
  default     = ""
  description = "AWS VPC Subnet ID"
}

variable "security_group_id" {
  type        = string
  default     = ""
  description = "AWS Security Group ID"
}

variable "host_os" {
  type        = string
  default     = "windows"
  description = "Your host OS"
}

variable "developer_name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "iam_instance_profile" {
  type = string
}
