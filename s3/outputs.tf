output "NomeBucket" {
  value = aws_s3_bucket.my-bucket.bucket
}

output "arnBucket" {
  value = aws_s3_bucket.my-bucket.arn
}

output "domainnameBucket" {
  value = aws_s3_bucket.my-bucket.bucket_domain_name
}

output "idBucket" {
  value = aws_s3_bucket.my-bucket.id
}

output "regionBucket" {
  value = aws_s3_bucket.my-bucket.region
}

output "tagsBucket" {
  value = aws_s3_bucket.my-bucket.tags
}

# The attribute "policy" is deprecated.
# output "policyBucket" {
#  value = aws_s3_bucket.my-bucket.policy
# }

# The attribute "policy" is deprecated.
# output "aclBucket" {
#  value = aws_s3_bucket.my-bucket.acl
# }
