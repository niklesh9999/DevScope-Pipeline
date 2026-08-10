resource "azurerm_subnet" "subnet" {
  for_each = var.subnet

  name                 = each.value.name
  resource_group_name  = each.value.resource_group
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes

  network_security_group_id = var.network_security_group_id[each.key]
}