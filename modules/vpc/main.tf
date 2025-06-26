# Default cidr block used

resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16" 
  enable_dns_hostnames = true
  tags = {
    Name = "${var.name}-vpc"
  }
}


# Allow internet traffic so EC2 nodes in EKS cluster can access container images from DockerHub
# Allows communication with external traffic
# Helm charts

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.name}-igw"
  }
}


# one subnet per hosted zones
# cidrsubnet() to split /16 into smaller chunks (/24 = 256 IPs) per hosted zone
# map_public_ip_on_launch = true since I am making this public for now. If using a NAT gateway we need a different config.

resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet("10.0.0.0/16", 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-subnet-${count.index + 1}"
  }
}



# outbound all allowed 0.0.0.0
# get my config subnets to the internet through the internet gateway

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.name}-public-rt"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}


# make all subnets inherit properties configured

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
