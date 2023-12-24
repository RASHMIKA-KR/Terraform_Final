# main.tf
provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"
  # other variables
}

module "public_subnet" {
  source                  = "./modules/public_subnet"
  vpc_id                  = module.vpc.vpc_id
}

module "private_subnet" {
  source                  = "./modules/private_subnet"
  vpc_id                  = module.vpc.vpc_id
  
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "route_tables" {
  source               = "./modules/route_tables"
  vpc_id               = module.vpc.vpc_id
  vpc_cidr_block       = "10.0.0.0/16"
  private_instance_id   = module.private_instance.private_instance_id
  internet_gateway_id  = module.vpc.internet_gateway_id
  public_subnet_id     = module.public_subnet.public_subnet_id
  private_subnet_id    = module.private_subnet.private_subnet_id
}

module "bastion_host" {
  source                = "./modules/bastion_host"
  vpc_id                = module.vpc.vpc_id
  public_subnet_id      = module.public_subnet.public_subnet_id
  bastion_ami           = "ami-0f1b9ed1b81d78f76"
  bastion_instance_type = "t2.micro"
  bastion_key_name      = "your-key-name"
  security_group_id     = module.security_groups.web_sg_id
}

module "private_instance" {
  source                = "./modules/private_instance"
  ami                   = "ami-0f1b9ed1b81d78f76"
  instance_type         = "t2.micro"
  private_subnet_id     = module.private_subnet.private_subnet_id
}
