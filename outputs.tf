output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_name" {
  value = "${var.name}"
}

output "public_subnet_ids" {
  value = ["${module.public_subnets.subnet_ids}"]
}

output "public_route_table_ids" {
  value = ["${module.public_subnets.route_table_ids}"]
}

output "private_subnet_ids" {
  value = ["${module.private_subnets.subnet_ids}"]
}

output "private_route_table_ids" {
  value = ["${module.private_subnets.route_table_ids}"]
}

output "database_subnet_ids" {
  value = ["${module.database_subnets.subnet_ids}"]
}

output "database_route_table_ids" {
  value = ["${module.database_subnets.route_table_ids}"]
}

output "database_subnet_group" {
  value = ["${aws_db_subnet_group.database.id}"]
}

output "nat_gateway_ips" {
  value = ["${module.nat_gateways.nat_gateway_ips}"]
}
