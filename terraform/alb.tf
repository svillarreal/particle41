resource "aws_lb" "eks_alb" {
  name               = "${var.project_name}-alb-${var.env}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.vpc.public_subnets
  tags = {
    Name = "${var.project_name}-alb-${var.env}"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}-alb-sg-${var.env}"
  description = "Security group for ALB"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-alb-sg-${var.env}"
  }
}

resource "aws_lb_target_group" "eks_target_group" {
  name        = "${var.project_name}-tg-${var.env}"
  port        = 30080
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "eks_nodes" {
  count            = length(module.eks.eks_managed_node_groups["default"].instance_types)
  target_group_arn = aws_lb_target_group.eks_target_group.arn
  target_id        = module.eks.eks_managed_node_groups["default"].instance_types[count.index]
  port             = 30080
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.eks_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.eks_target_group.arn
  }
}
