variable "gcp_project" {
  description = "ID du projet Google Cloud"
}

variable "gcp_region" {
  description = "Région Google Cloud pour le déploiement"
  default     = "us-central1"
}

variable "machine_type" {
  description = "Type de machine pour les instances VM"
  default     = "n1-standard-1"
}

variable "mysql_password" {
  description = "Mot de passe de la base de données MySQL/MariaDB"
}

variable "instance_count" {
  description = "Nombre d'instances VM à créer"
  default     = 2
}
