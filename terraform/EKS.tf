module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "fiap"
  cluster_version = "1.27"
  cluster_endpoint_private_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    fiap = {
      min_size     = 1
      max_size     = 4
      desired_size = 3
      vpc_security_group_ids = [aws_security_group.fiap_cluster.id]
      instance_types = ["t2.micro"]
    }
  }
}