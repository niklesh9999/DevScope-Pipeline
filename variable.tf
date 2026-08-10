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
    subnet_key = string
    nsg_key    = string
  }))
}




