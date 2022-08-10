ami_id = "ami-088afbba294231fe0"
instance_type = "t2.nano"
tags = {name="Terraform", enviroment="Dev"}
maquinas="3"
sg_name = "rules_ssh"
ingress_rules = [
    {
      from_port = "22"
      to_port = "22"
      protocol = "tcp"
      cidr_blocks= ["0.0.0.0/0"]
    },
    {
      from_port = "80"
      to_port = "80"
      protocol = "tcp"
      cidr_blocks= ["0.0.0.0/0"]
    }
]
egress_rules = [
    {
      from_port = "0"
      to_port = "0"
      protocol = "-1"
      cidr_blocks= ["0.0.0.0/0"]
    },
]
rsa_public="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCN/vKQ1CtejuJepUJCojPKM5lrmCBNz8mEnTqWhvocjoHwIMeRXIYt0bQb0aHhRS2142o530KiXb0spSQalBol+SXBakZtoBGgD/pCnwyXPiJtY82In8ceUybDLakqpB4S0s+F/GLy+bnDvs4zNXlMtt7wPkMM4zoIUUSGRKpeuPuycpko/zlCCj0HrOWeIyU1NuTjKrkidVy0dQ2b3pDblsSzYI0iXUqBe7E2AXJhLU3S2DWt0f8pL2HoiU+2mSpwu2XRM7TEfRbKeVhurL9RHgM9ji2vWvy7CXTiQ3AdnEgIvxp7miaaOAfBt0Y4rSrycdp2MlTbWM185oLwSU+v pf@pf-note"