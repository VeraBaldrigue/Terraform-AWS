output "Account_id" {
  value = data.aws_caller_identity.currentuser.account_id
}

output "Account_arn" {
  value = data.aws_caller_identity.currentuser.arn
}

output "Instance_Public_IPs" {
  value = aws_instance.aws-instance-vera.*.public_ip
}

output "Instance_Names" {
  value = join(",", aws_instance.aws-instance-vera.*.tags.Name)
}