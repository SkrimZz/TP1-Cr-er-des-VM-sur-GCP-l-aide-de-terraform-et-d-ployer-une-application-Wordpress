Documentation du Projet DevOps
Présentation
Ce projet a pour objectif de déployer automatiquement des sites WordPress dans des machines virtuelles sur la plateforme Google Cloud Platform (GCP). Le déploiement est automatisé en utilisant Terraform pour la gestion de l'infrastructure cloud et Ansible pour la configuration des machines virtuelles. Le projet comprend également un script d'exécution qui simplifie le processus de création et de déploiement.

Structure des Fichiers
Le projet est structuré de la manière suivante :

terraform : Contient les fichiers de configuration Terraform pour la création de l'infrastructure sur GCP.

main.tf : Configuration principale de Terraform.
variables.tf : Variables Terraform pour personnaliser le projet.
outputs.tf : Définition des sorties Terraform.
modules : Répertoire contenant des modules Terraform pour l'organisation modulaire.
vpc : Module pour la création du VPC, du sous-réseau et des règles de pare-feu.
wordpress_vm : Module pour la création de la machine virtuelle WordPress.
db_vm : Module pour la création de la machine virtuelle de la base de données.
ansible : Contient les playbooks Ansible pour la configuration des machines virtuelles.

wordpress.yml : Playbook pour la configuration de la machine virtuelle WordPress.
db.yml : Playbook pour la configuration de la machine virtuelle de la base de données.
scripts : Contient le script d'exécution pour automatiser le déploiement.

deploy.sh : Script bash qui gère la création des ressources Terraform, la configuration Ansible et la vérification de l'application.
docs : Emplacement pour la documentation du projet.

README.md : Cette documentation.
Prérequis
Avant de commencer, assurez-vous de disposer des éléments suivants :

Compte GCP : Vous devez avoir un compte Google Cloud Platform avec un projet créé.

Clé de Service GCP : Vous devez télécharger une clé de service au format JSON à partir de GCP pour l'authentification de Terraform.

Terraform : Vous devez installer Terraform sur votre machine.

Ansible : Vous devez installer Ansible sur votre machine.

Fichiers de Configuration : Vous devrez personnaliser les fichiers de configuration Terraform et les playbooks Ansible pour correspondre à vos besoins spécifiques.

Déploiement
Pour déployer l'application, exécutez le script deploy.sh situé dans le répertoire scripts :

bash
Copy code
./scripts/deploy.sh
Le script effectuera les actions suivantes :

Vérifier la présence de Terraform et Ansible.
Initialiser Terraform si nécessaire.
Créer l'infrastructure GCP avec Terraform.
Déployer la configuration avec Ansible.
Effectuer une vérification de l'application.


Configuration des Scripts pour Chaque Client
Si vous devez configurer ce déploiement pour différents clients, vous pouvez personnaliser les variables Terraform et les playbooks Ansible en fonction des besoins spécifiques de chaque client. Assurez-vous de garder une structure modulaire pour gérer les différentes configurations.

Remarques Finales
Ce projet est conçu pour automatiser le déploiement de sites WordPress sur GCP de manière efficace et reproductible. Assurez-vous de suivre les meilleures pratiques de sécurité et de gestion des secrets, en particulier lorsque vous travaillez avec des informations sensibles telles que les clés de service GCP.

N'hésitez pas à ajouter des informations supplémentaires à cette documentation en fonction de vos besoins et de la complexité de votre projet. Cette documentation doit servir de guide pour les personnes qui souhaitent utiliser ou comprendre le projet.
