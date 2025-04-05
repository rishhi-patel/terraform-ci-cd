provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  count         = var.core_count

  tags = {
    Name      = "Rishi_8972657_EC2_Instance_${count.index + 1}"
    CreatedBy = "Rishi_8972657"
    Project   = "Pract_Lab10"
  }
}
