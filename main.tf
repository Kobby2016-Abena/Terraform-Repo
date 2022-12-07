# Create VPC
resource "aws_vpc" "Prod-rock-VPC" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true 

  tags = {
    Name = "Prod-rock-VPC"
  }
}


# Create Public Subnet 1
resource "aws_subnet" "Test-public-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.Public-Subnet-1-cidr_block
  availability_zone = var.AZ-1
  map_public_ip_on_launch = true

  tags = {
    Name = "Test-public-sub1"
  }
}


# Create Public Subnet 2
resource "aws_subnet" "Test-public-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.Public-Subnet-2-cidr_block
  availability_zone = var.AZ-2
  map_public_ip_on_launch = true

  tags = {
    Name = "Test-public-sub2"
  }
}


# Create Private Subnet 1
resource "aws_subnet" "Test-private-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.Private-Subnet-1-cidr_block
  availability_zone ="eu-west-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Test-private-sub1"
  }
}



# Create Private Subnet 2
resource "aws_subnet" "Test-private-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.Private-Subnet-2-cidr_block
  availability_zone ="eu-west-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Test-private-sub2"
  }
}



# Create Route table and Add Public Route
resource "aws_route_table" "Test-public-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Test-IGW.id
  }

  tags = {
    Name = "Test-public-route-table"
  }
}


# Create Route table and Add Private Route
resource "aws_route_table" "Test-private-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id
  tags = {
    Name = "Test-private-route-table"
  }
}



# Associate Public Subnet 1 to "Public Route Table"
resource "aws_route_table_association" "Test-public-route-1-association" {
  subnet_id      = aws_subnet.Test-public-sub1.id
  route_table_id = aws_route_table.Test-public-route-table.id
}



# Associate Public Subnet 2 to "Public Route Table"
resource "aws_route_table_association" "Test-public-route-2-association" {
  subnet_id      = aws_subnet.Test-public-sub2.id
  route_table_id = aws_route_table.Test-public-route-table.id
}


# Associate Private Subnet 1 to " Private Route Table"
resource "aws_route_table_association" "Test-private-route-1-association" {
  subnet_id      = aws_subnet.Test-private-sub1.id
  route_table_id = aws_route_table.Test-private-route-table.id
}



# Associate Private Subnet 2 to " Private Route Table"
resource "aws_route_table_association" "Test-private-route-2-association" {
  subnet_id      = aws_subnet.Test-private-sub2.id
  route_table_id = aws_route_table.Test-private-route-table.id
}


# çreate Internet Gateway
resource "aws_internet_gateway" "Test-IGW" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-IGW"
  }
}


