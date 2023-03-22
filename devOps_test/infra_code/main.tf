module "vpc" {
  source      = "./modules/vpc"

  region      = var.region
  environment = var.environment
  vpc_cidr    = var.vpc_cidr
}

module "public_subnet" {
  source              = "./modules/public_subnet"

  public_subnets_cidr = var.public_subnets_cidr
  environment         = var.environment
  availability_zones  = var.availability_zones
  vpc_id              = module.vpc.vpc_id
  public_rt           = module.vpc.public_rt
}

module "private_subnet" {
  source               = "./modules/private_subnet"

  private_subnets_cidr = var.private_subnets_cidr
  environment          = var.environment
  availability_zones   = var.availability_zones
  vpc_id               = module.vpc.vpc_id
  natgateway_id        = module.public_subnet.natgateway_id
}

module "k8s" {
  source              = "./modules/k8s_cluster"
  
  subnet_ids          = module.public_subnet.public_subnet_id
  environment         = var.environment
}
