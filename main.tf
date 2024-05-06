module "resourcegroup" {
  source   = "./modules/resourcehroup"
  location = var.location
  name     = var.name
}

module "networking" {
  source         = "./modules/networking"
  location       = module.resourcegroup.resource_group_location
  resource_group = module.resourcegroup.resource_group_name
  vnetcidr       = var.vnetcidr
  websubnetcidr  = var.websubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
  appsubnetcidr  = var.appsubnetcidr
}

module "compute" {
  source         = "./modules/compute"
  location       = module.resourcegroup.resource_group_location
  resource_group = module.resourcegroup.resource_group_name
  web_subnet_id  = module.networking.web_subnet_id
  app_subnet_id  = module.networking.app_subnet_id
}

module "databse" {
  source = "./modules/database"
  name = module.resourcegroup.resource_group_name
  location = module.resourcegroup.resource_group_location
}