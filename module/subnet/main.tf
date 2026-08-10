resource "azurerm_subnet" "subnet" {
  for_each = var.subnet

  name                 = each.value.name
  resource_group_name  = each.value.resource_group
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "nsga" {
  for_each = var.subnet

  subnet_id = azurerm_subnet.subnet[each.key].id

  network_security_group_id = var.network_security_group_id[each.value.nsg_key]
}