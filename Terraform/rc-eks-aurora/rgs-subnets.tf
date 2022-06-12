resource "aws_subnet" "db_subnet_1" {
  vpc_id            = aws_vpc.rc-vpc.id
  cidr_block        = var.db_subnet_1_cidr
  availability_zone = var.az_1

  tags = {
    Name = "db_subnet_1"
  }
}

resource "aws_subnet" "db_subnet_2" {
  vpc_id            = aws_vpc.rc-vpc.id
  cidr_block        = var.db_subnet_2_cidr
  availability_zone = var.az_2

  tags = {
    Name = "db_subnet_2"
  }
}
