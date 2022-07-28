resource "aws_lb" "lb" {
    name               = "rails-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups = [
        aws_security_group.alb.id
    ]
    subnets = [
        aws_subnet.public_subnet_1.id,
        aws_subnet.public_subnet_2.id,
    ]
}

resource "aws_lb_target_group" "http" {
    name     = "rails-http"
    port     = 3000
    protocol = "HTTP"
    vpc_id = aws_vpc.vpc.id
}
