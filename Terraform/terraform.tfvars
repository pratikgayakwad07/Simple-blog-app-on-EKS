aws_region = "ap-south-1"

environment = "prod"

vpc_name = "blog-prod-vpc1"

vpc_cidr    = "10.0.0.0/16"

azs = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"] 

cluster_name    = "blog-prod-eks"
cluster_version = "1.31"

instance_type = "t2.medium"
key_name      = "terra-key"

rds_secret_name = "dev/S-blog/mysql"