#퍼블릭 라우팅

resource "aws_route_table" "public_route" {
 vpc_id = aws_vpc.my_vpc.id

 tags = {
   Name = "my_public_route"
 }

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "public-1" {
 subnet_id = aws_subnet.Public-Subnet-A.id
 route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "public-2" {
 subnet_id = aws_subnet.Public-Subnet-B.id
 route_table_id = aws_route_table.public_route.id
}


#프라이빗 라우팅

resource "aws_route_table" "private_route" {
 vpc_id = aws_vpc.my_vpc.id

 tags = {
    Name = "my_private_route"
 }
}

resource "aws_route_table_association" "private-1" {
 subnet_id = aws_subnet.Private-Subnet-A.id
 route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "private-2" {
 subnet_id = aws_subnet.Private-Subnet-B.id
 route_table_id = aws_route_table.private_route.id
}

resource "aws_route" "private_nat" {
 route_table_id = aws_route_table.private_route.id
 destination_cidr_block = "0.0.0.0/0"
 nat_gateway_id = aws_nat_gateway.nat_gateway_1.id
}




