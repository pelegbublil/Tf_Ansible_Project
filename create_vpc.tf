terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region     = "ca-central-1"
  access_key = "#access_key#"
  secret_key = "#secret_key#"
}
resource "aws_vpc" "akamai_vpc" {
    cidr_block = "192.168.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    instance_tenancy = "default"
    tags = {
    Name = "akamai_vpc"
  }
}
resource "aws_subnet" "private_subnet" {
    vpc_id = "${aws_vpc.akamai_vpc.id}"
    cidr_block = "192.168.0.0/24"
    map_public_ip_on_launch = "true"
    tags = {
    Name = "akamai_private_subnet"
  }
}
resource "aws_internet_gateway" "akamai_internet_g" {
  vpc_id = aws_vpc.akamai_vpc.id
  tags = {
    Name = "akamai_IG"
  }
}
resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.akamai_vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.akamai_internet_g.id
  }
  tags = {
    Name = "akamai_private_RT"
  }
}
resource "aws_route_table_association" "attach_private_RT" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_RT.id
}
