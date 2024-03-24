output "instance_ip" {
    value = aws_instance.jenkins-server.public_ip
}

output "vpc_id" {
    value = aws_vpc.jenkins-server-vpc.id
}