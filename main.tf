module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}

module "ec2" {
  source = "./modules/ec2"

  project_name  = var.project_name
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
  instance_type = var.instance_type
}

module "rds" {
  source = "./modules/rds"

  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  db_instance_class  = var.db_instance_class
  db_username        = var.db_username
  db_password        = var.db_password
  web_sg_id          = module.ec2.web_security_group_id
}
