resource "azurerm_subnet_network_security_group_association" "nsga" {
  for_each = var.nsga

  subnet_id = var.subnet_id[each.value.subnet_key]

  network_security_group_id = var.network_security_group_id[each.value.nsg_key]
}