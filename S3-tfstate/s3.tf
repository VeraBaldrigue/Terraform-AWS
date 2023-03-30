resource "aws_s3_bucket" "my-bucket-tfstate" {
  bucket = "bucket-vera-tfstate"
  tags = merge(var.tagstfstate, local.common_tags)
}

resource "aws_s3_bucket_acl" "my-bucket-tfstate-acl" {
  bucket = aws_s3_bucket.my-bucket-tfstate.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "my-bucket-public-access-block" {
  bucket = aws_s3_bucket.my-bucket-tfstate.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "my-iam-policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.my-bucket-tfstate.arn,
      "${aws_s3_bucket.my-bucket-tfstate.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "my-object-policy" {
  bucket = aws_s3_bucket.my-bucket-tfstate.id
  policy = data.aws_iam_policy_document.my-iam-policy.json
}