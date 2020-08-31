resource "aws_vpc" "udemy-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "udemy-vpc"
  }
}

resource "aws_subnet" "udemy-public-1a" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.udemy-vpc.id
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "udemy-public-1a"
  }
  depends_on = [aws_vpc.udemy-vpc]
}

resource "aws_subnet" "udemy-private-1a" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.udemy-vpc.id
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "udemy-private-1a"
  }

  depends_on = [aws_vpc.udemy-vpc]
}

resource "aws_internet_gateway" "udemy-igw" {
  vpc_id = aws_vpc.udemy-vpc.id

  depends_on = [aws_vpc.udemy-vpc]
}

resource "aws_nat_gateway" "udemy-natgw" {
  allocation_id = ""
  subnet_id = aws_subnet.udemy-private-1a.id
}