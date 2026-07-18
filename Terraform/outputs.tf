output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "cluster_name" {

  value = module.eks.cluster_name

}

output "cluster_endpoint" {

  value = module.eks.cluster_endpoint
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "db_secret_arn" {
  value = module.rds.db_secret_arn
}

output "backend_repository_url" {
  value = module.ecr.backend_repository_url
}

output "frontend_repository_url" {
  value = module.ecr.frontend_repository_url
}