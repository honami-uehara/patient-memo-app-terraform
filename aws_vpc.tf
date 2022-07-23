resource "aws_vpc" "vpc" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "patient-memo-app"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.168.0.0/20"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "patient-memo-app-ap-northeast-1a"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.168.16.0/20"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "patient-memo-app-ap-northeast-1c"
  }
}
