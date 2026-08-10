terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }
}

provider "azurerm" {
  features {

  }
}

module "resource_group" {
  source         = "./module/resource_group"
  resource_group = var.resource_group

}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "./module/vnet"
  vnet       = var.vnet

}


module "subnet" {
  depends_on = [module.vnet]
  source     = "./module/subnet"
  subnet     = var.subnet

}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "./module/public_ip"
  public_ip  = var.public_ip

}

module "nic" {
  depends_on = [module.resource_group, module.subnet]
  source     = "./module/nic"
  nic        = var.nic

}


module "vm" {
  depends_on = [module.resource_group, module.nic]
  source     = "./module/vm"
  vm         = var.vm

}

module "nsg" {
  depends_on = [module.resource_group]
  source     = "./module/NSG"
  nsg        = var.nsg
}


module "nsga" {
  source = "./module/nsga"

  nsga = var.nsga

  subnet_id = module.subnet.subnet_id

  network_security_group_id = module.nsg.network_security_group_id

  depends_on = [
    module.subnet,
    module.nsg
  ]
}


