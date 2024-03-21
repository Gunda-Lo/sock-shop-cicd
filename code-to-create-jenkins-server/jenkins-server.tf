data "vault_generic_secret" "aws_creds" {
  path = "secret/microservices-demo"
}


resource "aws_instance" "jenkins-server" {
  ami                         = var.aws_ami
  instance_type               = var.instance_type
    key_name                    = "mykey1"
  subnet_id                   = aws_subnet.jenkins-server-subnet.id
  vpc_security_group_ids      = [aws_security_group.jenkins-server-sg.id]
  associate_public_ip_address = true
  user_data                   = file("jenkins-server-setup.sh")
  root_block_device {
    volume_size = var.volume_size
  }
  tags = {
    Name = "${var.env_prefix}-server"
  }

}
