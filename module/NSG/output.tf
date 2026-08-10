output "network_security_group_id" {
  value = {
    for key, nsg in azurerm_network_security_group.nsg :
    key => nsg.id
  }
}