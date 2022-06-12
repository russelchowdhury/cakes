#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "rc-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = tomap({
    "Name"                                      = "terraform-eks-rc-node",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

resource "aws_subnet" "rc-sn" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.rc-vpc.id

  tags = tomap({
    "Name"                                      = "terraform-eks-rc-node",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

resource "aws_internet_gateway" "rc-ig" {
  vpc_id = aws_vpc.rc-vpc.id

  tags = {
    Name = "terraform-eks-rc"
  }
}

resource "aws_route_table" "rc-rt" {
  vpc_id = aws_vpc.rc-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rc-ig.id
  }
}

resource "aws_route_table_association" "rc-rta" {
  count = 2

  subnet_id      = aws_subnet.rc-sn.*.id[count.index]
  route_table_id = aws_route_table.rc-rt.id
}