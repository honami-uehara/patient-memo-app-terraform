resource "aws_security_group" "instance" {
    name        = "instance-patient-memo-app"
    description = "instance sg"
    vpc_id = aws_vpc.vpc.id
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "alb" {
  name        = "patient-memo-app-alb"
  description = "http and https"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "TCP"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
