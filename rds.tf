resource "aws_db_instance" "default" {
  instance_class         = "db.t2.micro"
  storage_type           = "gp2"
  allocated_storage      = 20
  max_allocated_storage  = 0

  engine                 = "mysql"
  engine_version         = "5.7"

  identifier             = "rds${var.default_suffix}"
  username               = "superadmin"
  password               = "!v91P80N1kM$F2wYnvbkMaK"

  skip_final_snapshot    = true
  publicly_accessible    = false
  multi_az               = false
  availability_zone      = var.avalability_zone
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.allow_rds.id]
}
