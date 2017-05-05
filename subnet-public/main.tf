resource "aws_subnet" "public" {
  count                   = "${length(var.subnets)}"
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.subnets[count.index]}"
  availability_zone       = "${element(var.azs, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
  tags                    = "${merge(var.tags, map("Name", format("%s.subnet-public.%s", var.vpc_name, element(var.azs, count.index))))}"
}

resource "aws_internet_gateway" "igw" {
  count  = "${signum(length(var.subnets))}"
  vpc_id = "${var.vpc_id}"
  tags   = "${merge(var.tags, map("Name", format("%s.igw", var.vpc_name)))}"
}

resource "aws_route_table" "public" {
  count  = "${signum(length(var.subnets))}"
  vpc_id = "${var.vpc_id}"
  tags   = "${merge(var.tags, map("Name", format("%s.rt-public", var.vpc_name)))}"
}

resource "aws_route" "public_internet_gateway" {
  count                  = "${signum(length(var.subnets))}"
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.subnets)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
