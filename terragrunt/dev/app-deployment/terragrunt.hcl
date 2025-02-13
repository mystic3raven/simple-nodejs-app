terraform {
  source = "git::https://github.com/mystic3raven/terraform-library.git//modules/app-deployment?ref=v1.0.0"
}

dependency "eks-cluster" {
  config_path = "../eks-cluster"
}

inputs = {
  kubeconfig      = dependency.eks-cluster.outputs.kubeconfig
  container_image = "<your-account-id>.dkr.ecr.<your-region>.amazonaws.com/simple-nodejs-app:latest"
}