resource "aws_security_group" "fiap_cluster" {
  name        = "fiap_cluster"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "fiap_cluster_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
  security_group_id = aws_security_group.fiap_cluster.id
}

resource "aws_security_group_rule" "fiap_cluster_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
  security_group_id = aws_security_group.fiap_cluster.id
}