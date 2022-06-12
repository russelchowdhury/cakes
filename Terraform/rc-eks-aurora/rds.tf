resource "aws_db_instance" "db" {
  depends_on             = [aws_security_group.db-sg]
  identifier             = var.db-identifier
  allocated_storage      = var.storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  name                   = var.db_name
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.id
}

resource "aws_db_subnet_group" "default" {
  name        = "default_db_subnet_group"
  description = "Our db group of subnets"
  subnet_ids  = [aws_subnet.db_subnet_1.id, aws_subnet.db_subnet_2.id]
}