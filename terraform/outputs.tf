output "wordpress_ip" {
  value = module.wordpress_vm.vm_instance_ip
}

output "db_instance_ip" {
  value = module.db_vm.instance_ips
}
