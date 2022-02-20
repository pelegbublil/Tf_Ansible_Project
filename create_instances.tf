resource "aws_instance" "LB" {
  ami           = "ami-03bcd79f25ca6b127"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.akamai_sg.id}"]
  subnet_id = "${aws_subnet.private_subnet.id}"
  private_ip = "192.168.0.11"
  associate_public_ip_address = true
  key_name = "Peleg_Bublil"
  tags = {
    Name = "akamai_LB_EC2"
  }

}
resource "aws_instance" "DB" {
  ami           = "ami-03bcd79f25ca6b127"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.akamai_sg.id}"]
  subnet_id = "${aws_subnet.private_subnet.id}"
  private_ip = "192.168.0.13"
  associate_public_ip_address = true
  key_name = "Peleg_Bublil"
  tags = {
    Name = "akamai_DB_EC2"
  }

}
resource "aws_instance" "WEB" {
  ami           = "ami-03bcd79f25ca6b127"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.akamai_sg.id}"]
  subnet_id = "${aws_subnet.private_subnet.id}"
  private_ip = "192.168.0.12"
  associate_public_ip_address = true
  key_name = "Peleg_Bublil"
  tags = {
    Name = "akamai_WEB_EC2"
  }
}


