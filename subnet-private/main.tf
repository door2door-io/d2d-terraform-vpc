resource "aws_subnet" "private" {
  count                   = "${length(var.subnets)}"
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.subnets[count.index]}"
  availability_zone       = "${element(var.azs, count.index)}"
  map_public_ip_on_launch = false
  tags                    = "${merge(var.tags, map("Name", format("%s.subnet-%s.%s", var.vpc_name, var.name, element(var.azs, count.index))))}"
}

resource "aws_route_table" "private" {
  count  = "${length(var.subnets)}"
  vpc_id = "${var.vpc_id}"
  tags   = "${merge(var.tags, map("Name", format("%s.rt-%s.%s", var.vpc_name, var.name, element(var.azs, count.index))))}"
}

resource "aws_route_table_association" "private" {
  count          = "${length(var.subnets)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_route" "private_nat_gateway" {
  count                  = "${var.enable_nat ? length(var.subnets) : 0}"
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(var.nat_gateways, count.index)}"
}
