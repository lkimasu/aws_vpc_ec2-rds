resource "aws_eip" "my_nat_gw" {
 vpc = true
 
 lifecycle {
	create_before_destroy = true
 }
}

resource "aws_nat_gateway" "nat_gateway_1"{
 allocation_id = aws_eip.my_nat_gw.id

 subnet_id = aws_subnet.Public-Subnet-A.id

 tags = {
     Name = "NAT-GW-1"
 }
}


