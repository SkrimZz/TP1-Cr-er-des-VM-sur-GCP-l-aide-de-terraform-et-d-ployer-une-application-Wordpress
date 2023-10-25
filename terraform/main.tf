provider "google" {
  credentials = file("service-account-key.json")
  project     = var.gcp_project
  region      = var.gcp_region
}

# Création du VPC, sous-réseau, règles de pare-feu
module "vpc" {
  source = "./modules/vpc"
  project = var.gcp_project
  region  = var.gcp_region
}

# Création des VM
module "wordpress_vm" {
  source = "./modules/wordpress_vm"
  project        = var.gcp_project
  region         = var.gcp_region
  machine_type   = var.machine_type
  mysql_password = var.mysql_password
}

module "db_vm" {
  source = "./modules/db_vm"
  project        = var.gcp_project
  region         = var.gcp_region
  machine_type   = var.machine_type
  mysql_password = var.mysql_password
  instance_count = var.instance_count
}
