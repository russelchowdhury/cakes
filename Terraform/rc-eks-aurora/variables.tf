variable "aws_region" {
  default = "us-west-1"
}

variable "cluster-name" {
  default = "terraform-eks-rc"
  type    = string
  description = "Identifier for cluster"
}

variable "db-identifier" {
  default     = "rcdb-rds"
  description = "Identifier for your DB"
}

variable "storage" {
  default     = "10"
  description = "Storage size in GB"
}

variable "engine" {
  default     = "postgres"
  description = "Engine type, example values postgres"
}

variable "engine_version" {
  description = "DB engine version"
  default     = "14.2"
}

variable "instance_class" {
  default     = "db.t3.micro"
  description = "Instance class"
}

variable "db_name" {
  default     = "rcdb"
  description = "db name"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "RDS root user password"
  type        = string
  sensitive   = true
}