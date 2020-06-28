resource "aws_instance" "bootstrap-server" {
  ami                    = "ami-032598fcc7e9d1c7a"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.bootstrap-server-subnet.id
  vpc_security_group_ids = ["${aws_security_group.bootstrap-server-security-group.id}"]
  key_name               = "my-key-pair-london"
  user_data              = file("scripts/bootstrap-server.sh")
  iam_instance_profile   = aws_iam_instance_profile.bootstrap-server-profile.id

  tags = {
    Name        = "bootstrap-server"
    Environment = terraform.workspace
  }
}
