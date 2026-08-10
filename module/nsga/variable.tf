variable "nsga" {
  type = map(object({
    subnet_key = string
    nsg_key    = string
  }))
}

variable "subnet_id" {
  type = map(string)
}

variable "network_security_group_id" {
  type = map(string)
}