resource "aws_s3_bucket" "my-bucket-tfstate" {
  bucket = "bucket-tfstate-vera"
  tags   = merge(var.tagstfstate, local.common_tags)
}

resource "aws_s3_bucket_ownership_controls" "my-bucket-tfstate" {
  bucket = aws_s3_bucket.my-bucket-tfstate.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "my-bucket-tfstate" {
  depends_on = [aws_s3_bucket_ownership_controls.my-bucket-tfstate]
  bucket = aws_s3_bucket.my-bucket-tfstate.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "my-bucket-tfstate-versioning" {
  bucket = aws_s3_bucket.my-bucket-tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

data "aws_iam_policy_document" "my-iam-policy" {
  statement {
    sid= "AllowBucket"
    principals {
      type        = "AWS"   
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.currentuser.account_id}:root"]         
    }
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = [
      aws_s3_bucket.my-bucket-tfstate.arn,
      "${aws_s3_bucket.my-bucket-tfstate.arn}/*",
    ]
  }
 }

resource "aws_s3_bucket_policy" "my-bucket-policy" {
  bucket = aws_s3_bucket.my-bucket-tfstate.id
  policy = data.aws_iam_policy_document.my-iam-policy.json
}

resource "aws_s3_bucket_public_access_block" "my-bucket-public-access-block" {
  bucket                  = aws_s3_bucket.my-bucket-tfstate.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  depends_on = [
    aws_s3_bucket_policy.my-bucket-policy
  ]
}