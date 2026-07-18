resource "aws_security_group" "rds" {

  name        = "blog-rds-sg"

  description = "RDS Security Group"

  vpc_id      = var.vpc_id

  ingress {

    description = "MySQL from EKS"

    from_port = 3306

    to_port = 3306

    protocol = "tcp"

    security_groups = [
      var.eks_node_sg_id
    ]
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {

    Name = "blog-rds-sg"
  }
}

##
module "mysql" {

  source = "terraform-aws-modules/rds/aws"

  version = "~> 6.9"

  identifier = "blog-prod-mysql"

  engine = "mysql"

  engine_version = "8.0"

  family = "mysql8.0"

  major_engine_version = "8.0"

  instance_class = "db.t4g.micro"

  allocated_storage = 20

  max_allocated_storage = 100

  db_name = "blogdb"

  username = "admin"

  port = 3306

  manage_master_user_password = true

  multi_az = false

  storage_encrypted = true

  deletion_protection = true

  backup_retention_period = 7

  backup_window = "03:00-04:00"

  maintenance_window = "Sun:04:00-Sun:05:00"

  create_db_subnet_group = true

  subnet_ids = var.private_subnets

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  performance_insights_enabled = true

  monitoring_interval = 60

  publicly_accessible = false

  skip_final_snapshot = false

  apply_immediately = false

  tags = {

    Environment = var.environment

    Project = "Simple-Blog-App"
  }
}