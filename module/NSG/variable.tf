variable "nsg" {
  type = map(object({
    name           = string
    location       = string
    resource_group = string
  }))
}