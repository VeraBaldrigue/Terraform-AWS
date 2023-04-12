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
  depends_on = [
    data.aws_iam_policy_document.my-iam-policy
  ]
}
resource "aws_s3_object" "my-object" {
  bucket       = aws_s3_bucket.my-bucket.bucket
  key          = "pasta-s3/my-object"          # Nome do arquivo no bucket
  source       = "${local.dir}${local.fileup}" # Diretório + Nome do arquivo local
  content_type = "/application/json"
  etag         = filemd5("${local.dir}${local.fileup}") # Hash para identificar alteração no arquivo
}

resource "aws_s3_object" "my-folder" {
  bucket = aws_s3_bucket.my-bucket.bucket
  key    = "my-folder" # Criando pasta 'my-folder' no bucket 'my-bucket'
}

#
# Data source definindo 'Resource policy' com vários 'Principals'
#
data "aws_iam_policy_document" "my-iam-policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
      # 
      # Outros exemplos de 'type' x 'identifiers'
      #
      # type        = "AWS"   
      # identifiers = ["arn:aws:iam::065992551625:user/veraiam"]   
      #
      # type        = "AWS"   
      # identifiers = ["*"]    -- Grant anonymous permissions
      #
      # type        = "CanonicalUser"
      # identifiers = ["85c7424416dacca1d27496e33af638d3e7250e45d749f1065f26e54f5683z999"]
      # 
      # type        = "Federated"
      # identifiers = ["accounts.google.com"]
    }
    effect = "Deny"
    actions = [
      "s3:GetObject",
    ]
    resources = [
      aws_s3_bucket.my-bucket.arn,
      "${aws_s3_bucket.my-bucket.arn}/*",
    ]
  }
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.my-bucket.arn,
      "${aws_s3_bucket.my-bucket.arn}/*",
    ]
    condition {
      test     = "StringLike"
      variable = "s3:prefix"

      values = [
        "",
        "my-folder/",
        "my-folder/&{aws:username}/",
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "my-bucket-policy" {
  bucket = aws_s3_bucket.my-bucket.id
  policy = data.aws_iam_policy_document.my-iam-policy.json
}
