// creation of vpc with cidr block
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Tawej_VPC"
        env = "dev"
}
}
// creation of public subnet within the vpc
resource "aws_subnet" "my_public_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block       = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
    Name = "my_public_subnet1"
    env = "dev"
}
}
resource "aws_subnet" "my_public_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block       = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    tags = {
    Name = "my_public_subnet1"
    env = "dev"
}
}
// creation of private subnet within the vpc
resource "aws_subnet" "my_private_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block       = "10.0.3.0/24"
    availability_zone = "us-east-1a"
    tags = {
    Name = "my_private_subnet1"
    env = "dev"
}
}
resource "aws_subnet" "my_private_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block       = "10.0.4.0/24"
    availability_zone = "us-east-1b"
    tags = {
    Name = "my_private_subnet2"
    env = "dev"
}
}
// creation of internet gateway for the vpc
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
    tags = {
    Name = "Tawej_IGW"
    env = "dev"
}
}
// creation of security group

resource "aws_security_group" "web_sg" {
  name        = "Tawej-sg"
  description = "Security group with 22, 80, and 8080 open"
  vpc_id      = "${aws_vpc.my_vpc.id}"

  # SSH
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Custom app port 8080
  ingress {
    description = "Allow TCP 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound - allow all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}
