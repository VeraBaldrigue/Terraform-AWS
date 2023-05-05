output "PropertiesBucket" {
  value = aws_s3_bucket.my-bucket-tfstate.*
}


output "NomeBucket" {
  value = aws_s3_bucket.my-bucket-tfstate.bucket
}

output "arnBucket" {
  value = aws_s3_bucket.my-bucket-tfstate.arn
}

output "domainnameBucket" {
  value = aws_s3_bucket.my-bucket-tfstate.bucket_domain_name
}

output "idBucket" {
  value = aws_s3_bucket.my-bucket-tfstate.id
}

output "regionBucket" {
  value = aws_s3_bucket.my-bucket-tfstate.region
}

output "tagsBucket" {
  value = aws_s3_bucket.my-bucket-tfstate.tags
}

output "account_id" {
  value = data.aws_caller_identity.currentuser.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.currentuser.arn
}

output "caller_user" {
  value = data.aws_caller_identity.currentuser.user_id
}

# The attribute "policy" is deprecated.
# output "policyBucket" {
#  value = aws_s3_bucket.my-bucket.policy
# }

# The attribute "policy" is deprecated.
# output "aclBucket" {
#  value = aws_s3_bucket.my-bucket.acl
# }
