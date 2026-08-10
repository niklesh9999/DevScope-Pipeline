variable "resource_group" {
  type = map(any)
}

variable "vnet" {
  type = map(any)
}

variable "subnet" {
  type = map(object({
    name                 = string
    resource_group       = string
    virtual_network_name = string
    address_prefixes     = list(string)
    nsg_key              = string
  }))
}

variable "public_ip" {
  type = map(any)

}
variable "nic" {
  type = map(any)

}


variable "vm" {
  type = map(any)

}

variable "nsg" {
  type = map(object({
    name           = string
    location       = string
    resource_group = string
  }))
}




