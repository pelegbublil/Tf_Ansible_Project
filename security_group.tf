resource "aws_security_group" "akamai_sg" {
  name        = "akamai_sg"
  description = "akamai_sg"
  vpc_id      = aws_vpc.akamai_vpc.id

  ingress {
    description = "Workstation IP to all servers"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["16.170.167.172/32"]
  }
  ingress {
    description = "Workstation to LB server"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["16.170.167.172/32"]
  }
  ingress {
    description = "Allow Any internal communication"
    from_port = 1
    protocol  = "all"
    to_port   = 65535
    cidr_blocks = ["192.168.0.0/24"]
  }
  egress {
    description = "Allow Any internal communication"
    from_port = 1
    protocol  = "all"
    to_port   = 65535
    cidr_blocks = ["192.168.0.0/24"]
  }
    tags = {
    Name = "akamai_sg"
  }
}