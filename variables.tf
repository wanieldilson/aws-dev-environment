variable "local_ip" {
  type        = string
  default     = ""
  description = "Browse to https://whatsmyip.org to find your local external IP"
}

variable "local_dev" {
  type    = bool
  default = false
}