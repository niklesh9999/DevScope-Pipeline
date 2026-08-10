variable "nsga" {
  type = map(object({
    nsg_name             = string
    subnet_name          = string
    virtual_network_name = string
    resource_group       = string
  }))
}