module "ec2_instance" {
  for_each = var.instancias
  source  = "terraform-aws-modules/ec2-instance/aws"

  name     = each.key
  instance_type          = each.value["instance_type"]
  monitoring             = true
  subnet_id              = "subnet-057383707e2f24496"

  tags = {
    Terraform   = "true"
    Environment = each.value["environment"]
  }
}