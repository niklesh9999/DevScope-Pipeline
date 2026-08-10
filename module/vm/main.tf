resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vm

  name                = each.value.name
  resource_group_name = each.value.resource_group
  location            = each.value.location
  size                = each.value.size

  admin_username = each.value.admin_username

  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
  ]

  disable_password_authentication = true

  # Checkov CKV_AZURE_50
  allow_extension_operations = false

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = each.value.ssh_public_key
  }

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}