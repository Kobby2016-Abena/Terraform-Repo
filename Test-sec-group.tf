resource "aws_security_group" "Test-sec-group" {
  name        = "Test-sec-group"
  description = "Enable HTTP/SSH access on port 80/22"
  vpc_id      = aws_vpc.Prod-rock-VPC.id

  ingress {
    description      = "HTTP Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }


ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["137.220.84.161/32"]
  
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  tags = {
    Name = "Test Security group"
  }
}




