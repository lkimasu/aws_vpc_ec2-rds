resource "aws_key_pair" "web_admin" {
  key_name = "web_admin"
  public_key = file("~/.ssh/web_admin.pub")
}

resource "aws_instance" "web" {
 ami = "ami-035233c9da2fabf52"
 instance_type = "t2.micro"
 key_name = aws_key_pair.web_admin.key_name
 subnet_id = aws_subnet.Public-Subnet-A.id
 vpc_security_group_ids = [
 aws_security_group.my_security.id
 ]
}

resource "aws_security_group" "my_security" {
  name = "allow_ssh_from_all"
  description = "Allow SSH,HTTP allow"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
