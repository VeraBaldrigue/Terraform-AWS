terraform {}
provider aws {
    region = var.region
}
resource "aws_instance" "aws-instance-vera" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = var.tags
}