data "aws_ami" "ubuntu-primary" {
  most_recent = true
  provider = aws.primary

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ubuntu-secondary" {
  most_recent = true
  provider = aws.secondary

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "webwest" {
  ami           = data.aws_ami.ubuntu-primary.id
  instance_type = "t3.micro"
  provider      = aws.primary

  tags = {
    Name = "HelloWorld - Primary Region"
    Env  = "develop"
  }
}

resource "aws_instance" "webeast" {
  ami           = data.aws_ami.ubuntu-secondary.id
  instance_type = "t3.micro"
  provider      = aws.secondary

  tags = {
    Name = "HelloWorld - Secondary Region"
    Env  = "develop"
  }
}
