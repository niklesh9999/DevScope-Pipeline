variable "nsg" {
  type = map(object({
    name           = string
    location       = string
    resource_group = string
    subnet_key     = string
  }))
}

variable "subnet_id" {
  type = map(string)
}