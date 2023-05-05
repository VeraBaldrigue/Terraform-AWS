resource "aws_instance" "aws-instance-vera" {
  count         = var.instance_type_and_number.number_of_instances <= 0 ? 1 : var.instance_type_and_number.number_of_instances
  ami           = var.instance_ami
  instance_type = var.instance_type_and_number.instance_type

  tags = merge(
    local.common_tags,
    {
      Environment = format("Ambiente %s", var.env)
      Name        = format("aws-instance-vera-${var.env}-%d", count.index + 1)
    }
  )
}