output "instance_ip" {
  value = aws_instance.proyecto.*.public_ip
}