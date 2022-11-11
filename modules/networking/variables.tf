variable "vpc_cidr_block" {
  type        = string
  default     = "10.69.0.0/16"
  description = "Primary Cidr Block for the VPC"
}

variable "cidr_block" {
  type        = string
  default     = "10.69.1.0/24"
  description = "list of cidr blocks for the VPC"
}

variable "local_ip" {
  type        = string
  default     = ""
  description = "Browse to https://whatsmyip.org to find your local external IP"
}