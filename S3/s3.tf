resource "aws_s3_bucket" "my-bucket" {
  bucket = "bucket-vera"

  tags = merge(var.tags, local.common_tags)
}

resource "aws_s3_bucket_acl" "my-bucket-acl" {
  bucket = aws_s3_bucket.my-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "my-bucket-public-access-block" {
  bucket = aws_s3_bucket.my-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "my-object" {
  bucket       = aws_s3_bucket.my-bucket.bucket
  key          = "pasta-s3/my-object"          # Nome do arquivo no bucket
  source       = "${local.dir}${local.fileup}" # Diretório + Nome do arquivo local
  content_type = "/application/json"
  etag         = filemd5("${local.dir}${local.fileup}") # Hash para identificar alteração no arquivo
}

resource "aws_s3_bucket" "my-bucket-tfstate" {
  bucket = "bucket-vera-tfstate"
  tags = merge(var.tagstfstate, local.common_tags)
}

resource "aws_s3_bucket_acl" "my-bucket-tfstate-acl" {
  bucket = aws_s3_bucket.my-bucket-tfstate.id
  acl    = "private"
}

data "aws_iam_policy_document" "my-iam-policy" {
  statement {
    principals {
      #      type        = "AWS"   ==> Incompatível com aws_s3_bucket_public_access_block
      #      identifiers = ["*"]   ==> Incompatível com aws_s3_bucket_public_access_block
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.my-bucket.arn,
      "${aws_s3_bucket.my-bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "my-object-policy" {
  # bucket = aws_s3_bucket.my-bucket.id
  policy = data.aws_iam_policy_document.my-iam-policy.json
}