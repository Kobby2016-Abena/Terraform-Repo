resource "aws_vpc" "Prod-rock-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Prod-rock-VPC"
  }
}

resource "aws_subnet" "Test-public-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Test-public-sub1"
  }
}

resource "aws_subnet" "Test-public-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Test-public-sub2"
  }
}

resource "aws_subnet" "Test-private-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Test-private-sub1"
  }
}


resource "aws_subnet" "Test-private-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Test-private-sub2"
  }
}


resource "aws_route_table" "Test-public-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id
  tags = {
    Name = "Test-public-route-table"
  }
}


resource "aws_route_table" "Test-private-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id
  tags = {
    Name = "Test-private-route-table"
  }
}

resource "aws_route_table_association" "Test-public-route-1-association" {
  subnet_id      = aws_subnet.Test-public-sub1.id
  route_table_id = aws_route_table.Test-public-route-table.id
}


resource "aws_route_table_association" "Test-public-route-2-association" {
  subnet_id      = aws_subnet.Test-public-sub2.id
  route_table_id = aws_route_table.Test-public-route-table.id
}


resource "aws_route_table_association" "Test-private-route-1-association" {
  subnet_id      = aws_subnet.Test-private-sub1.id
  route_table_id = aws_route_table.Test-private-route-table.id
}


resource "aws_route_table_association" "Test-private-route-2-association" {
  subnet_id      = aws_subnet.Test-private-sub2.id
  route_table_id = aws_route_table.Test-private-route-table.id
}


resource "aws_internet_gateway" "Test-IGW" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-IGW"
  }
}

resource "aws_route" "Test-public-IGW-route" {
  route_table_id            = aws_route_table.Test-public-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.Test-IGW.id
}

