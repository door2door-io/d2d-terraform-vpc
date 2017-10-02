resource "aws_eip" "natgw" {
  count = "${var.nat_gateway_count}"
  vpc   = true
}

resource "aws_nat_gateway" "natgw" {
  count         = "${var.nat_gateway_count}"
  allocation_id = "${element(aws_eip.natgw.*.id, count.index)}"
  subnet_id     = "${element(var.public_subnets, count.index)}"
  tags          = "${merge(var.tags, map("Name", format("%s.natgw-%d", var.vpc_name, count.index + 1)))}"
  lifecycle     = {
    ignore_changes = ["allocation_id"]
  }
}
