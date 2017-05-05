output "subnet_ids" {
  value = ["${aws_subnet.public.*.id}"]
}

output "route_table_ids" {
  value = ["${aws_route_table.public.*.id}"]
}

output "igw_id" {
  value = "${aws_internet_gateway.igw.id}"
}
