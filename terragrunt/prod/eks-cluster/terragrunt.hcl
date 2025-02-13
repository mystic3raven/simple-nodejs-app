terraform {
  source = "git::https://github.com/mystic3raven/terraform-library.git//modules/eks-cluster?ref=v1.0.0"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  cluster_name       = "prod-eks-cluster"
  vpc_id             = dependency.vpc.outputs.vpc_id
  private_subnet_ids = dependency.vpc.outputs.private_subnets
  public_subnet_ids  = dependency.vpc.outputs.public_subnets

  # Prod-specific settings
  node_group_instance_type = "m5.large" # Larger instance type for production
  desired_capacity         = 3         # More nodes for high availability
  max_size                 = 6         # Higher scaling limit
}