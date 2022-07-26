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

resource "aws_route_table" "public_route_table_patient_memo_app" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "route-table-patient-memo-app"
  }
} 

resource "aws_route_table_association" "public_1_route_table_assocication" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table_patient_memo_app.id
}

resource "aws_route_table_association" "public_2_route_table_assocication" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table_patient_memo_app.id
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "internet-gateway-patient-memo-app"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table_patient_memo_app.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}
