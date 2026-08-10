resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsg

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"

    # IMPORTANT:
    # "*" करने पर CKV_AZURE_10 fail होगा.
    # यहाँ अपने trusted/admin network का CIDR डालो.
    source_address_prefix     = "10.0.0.0/24"

    destination_address_prefix = "*"
  }
}