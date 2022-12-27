resource "aws_db_instance" "my_db" {
  allocated_storage = 8
  engine = "mysql"
  engine_version = "8.0.28"
  instance_class = "db.t2.micro"
  username = "admin"
  password = "admin12345"
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet.name	
}

resource "aws_security_group" "my_db_security" {
  name = "allow_db"
  description = "Allow EC2 to RDS"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.my_security.id]
  }
   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_db_subnet_group" "my_db_subnet" {
	name = "my_db_subnet"
 	subnet_ids = [aws_subnet.Private-Subnet-A.id, aws_subnet.Private-Subnet-B.id ] 

}

