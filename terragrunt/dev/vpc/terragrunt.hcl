terraform {
  source = "git::https://github.com/mystic3raven/terraform-library.git//modules/vpc?ref=v1.0.0"
}

inputs = {
  vpc_name           = "dev-vpc"
  cidr_block         = "10.0.0.0/16"
  azs                = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets_cidr  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  environment        = "dev"
}