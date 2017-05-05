output "nat_gateway_ips" {
  value = ["${aws_nat_gateway.natgw.*.public_ip}"]
}

output "nat_gateway_ids" {
  value = ["${aws_nat_gateway.natgw.*.id}"]
}
