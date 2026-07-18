output "db_endpoint" {
  value = module.mysql.db_instance_endpoint
}

output "db_name" {
  value = module.mysql.db_instance_name
}

output "db_secret_arn" {
  value = module.mysql.db_instance_master_user_secret_arn
}