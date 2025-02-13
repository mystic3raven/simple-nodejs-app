terraform {
  source = "git::https://github.com/mystic3raven/terraform-library.git//modules/vpc?ref=v1.0.0"
}

inputs = {
  vpc_name           = "prod-vpc"
  cidr_block         = "192.168.0.0/16"
  azs                = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets_cidr = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  public_subnets_cidr  = ["192.168.101.0/24", "192.168.102.0/24", "192.168.103.0/24"]
  environment        = "prod"
}