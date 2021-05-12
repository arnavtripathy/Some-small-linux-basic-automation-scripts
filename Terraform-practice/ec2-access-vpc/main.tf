resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
  user_data=("/file/to/path")
  key_name=aws_key_pair.web.id
  vpc_security_group_ids=[ aws_security_group.allow_ssh.id]
}
resource "aws_key_pair" "web"{
	public_key=file("/pub/file")
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"

  ingress {
    description      = "ssh_access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

}
outpur "public_ip"{
   value= aws_instance.app_server.public_ip
}


