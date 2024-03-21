resource "aws_vpc" "jenkins-server-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "jenkins-server-subnet" {
  vpc_id            = aws_vpc.jenkins-server-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.env_prefix}-subnet"
  }
}

resource "aws_internet_gateway" "jenkins-server-igw" {
  vpc_id = aws_vpc.jenkins-server-vpc.id
  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

resource "aws_default_route_table" "jenkins-server-rtb" {
    default_route_table_id = aws_vpc.jenkins-server-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins-server-igw.id
  }
  tags = {
    Name = "${var.env_prefix}-rtb"
  }
}

resource "aws_route_table_association" "jenkins-server-rtb-association" {
  subnet_id      = aws_subnet.jenkins-server-subnet.id
  route_table_id = aws_default_route_table.jenkins-server-rtb.id
}

resource "aws_security_group" "jenkins-server-sg" {
  name        = "${var.env_prefix}-sg"
  description = "Allow Jenkins, Sonarqube, Prometheus, SSH inbound traffic"
  vpc_id      = aws_vpc.jenkins-server-vpc.id

    ingress = [
    for port in [22, 8080, 9000, 3000, 443, 9090, 80] : {
      description      = "Traffic from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      ipv6_cidr_blocks = ["::/0"]
      self             = false
      prefix_list_ids  = []
      security_groups  = []
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ]


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_prefix}-sg"
  }
}
