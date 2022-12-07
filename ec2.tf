resource "aws_instance" "Test-Serve-1" {
  ami   = "ami-02cd8b53d691380a4"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Test-public-sub1.id
  availability_zone = "eu-west-2a"


  tags = {
    Name = "Test serve 1"
  }
}




resource "aws_instance" "Test-Serve-2" {
  ami   = "ami-02cd8b53d691380a4"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Test-private-sub1.id
  availability_zone = "eu-west-2a"


  tags = {
    Name = "Test serve 2"
  }
}




