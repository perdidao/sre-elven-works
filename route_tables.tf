resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "igw${var.default_suffix}"
  }
}

resource "aws_default_route_table" "route_table_public" {
  default_route_table_id = aws_vpc.default.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "rt-public${var.default_suffix}"
  }
}

resource "aws_route_table_association" "route_table_public_a" {
  subnet_id      = aws_subnet.subnet_public_a.id
  route_table_id = aws_vpc.default.default_route_table_id
}

resource "aws_route_table_association" "route_table_public_b" {
  subnet_id      = aws_subnet.subnet_public_b.id
  route_table_id = aws_vpc.default.default_route_table_id
}

## Private
resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "rt-private${var.default_suffix}"
  }
}

resource "aws_route_table_association" "route_table_private_a" {
  subnet_id      = aws_subnet.subnet_private_a.id
  route_table_id = aws_route_table.route_table_private.id
}

resource "aws_route_table_association" "route_table_private_b" {
  subnet_id      = aws_subnet.subnet_private_b.id
  route_table_id = aws_route_table.route_table_private.id
}
