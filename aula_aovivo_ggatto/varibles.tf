variable "instancias" {
  type        = map(any)
  description = ""
  default = {
    web = {
      instance_type = "t3.micro"
      environment   = "dev"
    },
    bd = {
      instance_type = "t2.micro"
      environment   = "dev"
    }
  }
}