variable "subnet" {
  type = map(object({
    name                 = string
    resource_group       = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "network_security_group_id" {
  type = map(string)
}