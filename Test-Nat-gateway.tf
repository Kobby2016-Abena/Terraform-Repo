resource "aws_eip" "EIP-1" {
  vpc      = true

  tags = {
    Name = "EIP-1"
  }
}


resource "aws_eip" "EIP-2" {
  vpc      = true

  tags = {
    Name = "EIP-2"
  }
}


resource "aws_nat_gateway" "Test-Nat-gateway-1" {
  allocation_id = aws_eip.EIP-1.id
  subnet_id     = aws_subnet.Test-public-sub1.id

  tags = {
    Name = "Test-Nat-gateway-public subnet 1"
  }

}


resource "aws_nat_gateway" "Test-Nat-gateway-2" {
  allocation_id = aws_eip.EIP-2.id
  subnet_id     = aws_subnet.Test-public-sub2.id

  tags = {
    Name = "Test-Nat-gateway-public subnet 2"
  }

}


resource "aws_route_table" "private-route-1" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Test-Nat-gateway-1.id
  }


  tags = {
    Name = "private route 1"
  }
}



resource "aws_route_table" "private-route-2" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Test-Nat-gateway-2.id
  }


  tags = {
    Name = "private route 2"
  }
}

