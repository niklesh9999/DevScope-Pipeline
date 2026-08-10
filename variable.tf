variable "resource_group" {
  type = map(any)
}

variable "vnet" {
  type = map(any)
}

variable "subnet" {
  type = map(any)

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
  type = map(any)
}


variable "nsga" {
  type = map(object({
    nsg_name             = string
    subnet_name          = string
    virtual_network_name = string
    resource_group       = string
  }))
}




