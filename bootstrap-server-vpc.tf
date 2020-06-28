resource "aws_vpc" "bootstrap-server-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = "bootstrap-server-vpc"
    Environment = terraform.workspace
  }
}

resource "aws_subnet" "bootstrap-server-subnet" {
  vpc_id            = aws_vpc.bootstrap-server-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.bootstrap-azs.names[0]

  tags = {
    Name        = "bootstrap-server-subnet"
    Environment = terraform.workspace
  }
}
