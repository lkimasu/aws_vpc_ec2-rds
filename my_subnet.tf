resource "aws_subnet" "Public-Subnet-A" {
 vpc_id = aws_vpc.my_vpc.id
 cidr_block = "10.0.0.0/24"
 availability_zone ="ap-northeast-2a"
 tags = {
  Name = "Public-Subnet-A"
}
}

resource "aws_subnet" "Public-Subnet-B" {
 vpc_id = aws_vpc.my_vpc.id
 cidr_block = "10.0.1.0/24"
 availability_zone ="ap-northeast-2b"
 tags = {
  Name = "Public-Subnet-B"
}
}

resource "aws_subnet" "Private-Subnet-A" {
 vpc_id = aws_vpc.my_vpc.id
 cidr_block = "10.0.16.0/20"
 availability_zone ="ap-northeast-2a"
 tags = {
  Name = "Private-Subnet-A"
}
}

resource "aws_subnet" "Private-Subnet-B" {
 vpc_id = aws_vpc.my_vpc.id
 cidr_block = "10.0.32.0/20"
 availability_zone ="ap-northeast-2b"
 tags = {
  Name = "Private-Subnet-B"
}
}





