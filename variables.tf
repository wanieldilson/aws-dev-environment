variable "local_ip" {
  type        = string
  default     = ""
  description = "Browse to https://whatsmyip.org to find your local external IP"
}

variable "path_to_public_key" {
  type        = string
  default     = ""
  description = "Path to your public SSH key usually ~/.ssh/<<your_key_name>>.pub"
}

variable "host_os" {
  type        = string
  default     = "windows"
  description = "Your host OS"
}
