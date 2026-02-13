provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  env                = "dev"
}

module "ec2" {
  source = "../../modules/ec2"

  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_id
  env           = "dev"
}