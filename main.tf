provider "aws" {
  region = "sa-east-1"
}

resource "aws_security_group" "ssh_connection" {
  name        = var.sg_name
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
        from_port   = ingress.value.from_port
        to_port     = ingress.value.to_port
        protocol    = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
        from_port   = egress.value.from_port
        to_port     = egress.value.to_port
        protocol    = egress.value.protocol
        cidr_blocks = egress.value.cidr_blocks
    }
  }

}
resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = var.rsa_public
}    

resource "aws_instance" "proyecto" {
    # ami = "ami-01715ada337e1f5d3"
    ami = var.ami_id
    instance_type = var.instance_type
    tags = var.tags
    security_groups = ["${aws_security_group.ssh_connection.name}"]
    #se crea el provisioner para conectarse de forma remota.
    key_name = "ssh-key"

    provisioner "remote-exec" {
      connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("/home/pf/.ssh/id_rsa")
        host = self.public_ip
      }
      inline = [
          "sudo apt-get -y update",
          "sudo apt-get -y install docker",
          "sudo service nginx docker",
        ]
    }
    
}


