resource "aws_route_table" "bootstrap-server-route-table" {
  vpc_id = aws_vpc.bootstrap-server-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bootstrap-server-igw.id
  }
}

resource "aws_route_table_association" "bootstrap-server-rt-association" {
  route_table_id = aws_route_table.bootstrap-server-route-table.id
  subnet_id      = aws_subnet.bootstrap-server-subnet.id
}

resource "aws_internet_gateway" "bootstrap-server-igw" {
  vpc_id = aws_vpc.bootstrap-server-vpc.id

  tags = {
    Name = "bootstrap-server-igw"
  }
}
