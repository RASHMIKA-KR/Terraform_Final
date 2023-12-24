output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.public_subnet.public_subnet_id
}

output "private_subnet_id" {
  value = module.private_subnet.private_subnet_id
}

output "web_sg_id" {
  value = module.security_groups.web_sg_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "private_instance_id" {
  value = module.private_instance.private_instance_id
}

output "bastion_host_public_ip" {
  value = module.bastion_host.bastion_host_public_ip
}

output "bastion_host_id" {
  value = module.bastion_host.bastion_host_id
}

output "public_route_table_id" {
  value = module.route_tables.public_route_table_id
}

output "private_route_table_id" {
  value = module.route_tables.private_route_table_id
}