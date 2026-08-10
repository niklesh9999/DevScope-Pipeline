resource "azurerm_subnet_network_security_group_association" "nsga" {
  for_each = var.nsga

  subnet_id = data.azurerm_subnet.subnet[each.key].id

  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}