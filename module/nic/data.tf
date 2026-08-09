data "azurerm_subnet" "subnet" {
    for_each = var.nic
    name = each.value.subnet
    resource_group_name= each.value.resource_group
    virtual_network_name = each.value.vnet_name


  
}