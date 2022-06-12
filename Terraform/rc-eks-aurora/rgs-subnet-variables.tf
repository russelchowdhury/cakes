variable "db_subnet_1_cidr" {
  default     = "10.0.3.0/24"
  description = "Your AZ"
}

variable "db_subnet_2_cidr" {
  default     = "10.0.4.0/24"
  description = "Your AZ"
}

variable "az_1" {
  default     = "us-west-1a"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  default     = "us-west-1b"
  description = "Your Az2, use AWS CLI to find your account specific"
}