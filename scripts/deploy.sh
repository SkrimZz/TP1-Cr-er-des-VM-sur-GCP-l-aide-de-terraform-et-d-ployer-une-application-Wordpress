#!/bin/bash

# Vérification de la présence de Terraform
if ! command -v terraform &> /dev/null; then
  echo "Terraform n'est pas installé. Veuillez installer Terraform."
  exit 1
fi

# Vérification de la présence des fichiers Terraform
if [ ! -d "terraform" ]; then
  echo "Le répertoire Terraform n'existe pas. Assurez-vous d'avoir la structure du projet correcte."
  exit 1
fi

# Initialisation de Terraform (si c'est la première fois)
cd terraform
if [ ! -d ".terraform" ]; then
  terraform init
fi

# Application de la création avec Terraform
terraform apply -auto-approve

# Vérification de la présence d'Ansible
if ! command -v ansible &> /dev/null; then
  echo "Ansible n'est pas installé. Veuillez installer Ansible."
  exit 1
fi

# Vérification de la présence des fichiers Ansible
if [ ! -d "../ansible" ]; then
  echo "Le répertoire Ansible n'existe pas. Assurez-vous d'avoir la structure du projet correcte."
  exit 1
fi

# Création du fichier hosts Ansible (si c'est la première fois)
if [ ! -f "../ansible/hosts" ]; then
  echo "[wordpress_vm]" > "../ansible/hosts"
  echo "wordpress_server ansible_host=<Adresse_IP_de_la_VM_WordPress>" >> "../ansible/hosts"
  echo "" >> "../ansible/hosts"
  echo "[db_vm]" >> "../ansible/hosts"
  echo "db_server ansible_host=<Adresse_IP_de_la_VM_Base_de_Données>" >> "../ansible/hosts"
fi

# Utilisation de la commande Ansible pour appliquer le déploiement
ansible-playbook -i "../ansible/hosts" ../ansible/wordpress.yml
ansible-playbook -i "../ansible/hosts" ../ansible/db.yml

# Vérification de l'application (exemple)
# Remplacez les commandes de vérification par celles spécifiques à votre application
# Par exemple, vous pouvez effectuer un curl sur l'IP de WordPress et vérifier la réponse
# curl -I <Adresse_IP_de_la_VM_WordPress> | grep "200 OK"

# Remarque : Assurez-vous de personnaliser les vérifications en fonction de votre application.

# Exemple de vérification d'une page WordPress (doit être adapté à votre cas)
wordpress_check="$(curl -I <Adresse_IP_de_la_VM_WordPress> | grep "200 OK")"

if [[ -n "$wordpress_check" ]]; then
  echo "L'application WordPress est opérationnelle."
else
  echo "L'application WordPress n'est pas opérationnelle. Veuillez vérifier le déploiement."
fi
