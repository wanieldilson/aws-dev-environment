variable "subnet_id" {
  type        = string
  default     = ""
  description = "AWS VPC Subnet ID"
}

variable "security_group_id" {
  type        = string
  default     = ""
  description = "AWS SEcurity Group ID"
}

variable "host_os" {
  type        = string
  default     = "windows"
  description = "Your host OS"
}

