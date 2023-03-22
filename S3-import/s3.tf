# Para importar um recurso que não foi criado pelo terraform é necessário defini-lo localmente antes de executar o 'terraform import'.
# Faça a associação do bucket que será importado com um nome local para que o terraform o conheça.
# Não esquecer de importar as tags no arquivo variables.tf
# Nesse exemplo, definimos localmente o bucket com o nome: my-bucket-import-vera e estamos importando as tags também.
# Supondo que na AWS o bucket tem o nome "bucket-vera-import", o comando import ficaria assim:
# terraform import aws_s3_bucket.my-bucket-import-vera bucket-vera-import 
#
# Pode-se utilizar o terraform console para obter informações de recursos criados na AWS.
# Exemplo:
# terraform console <enter>
# aws_s3_bucket.my-bucket-import-vera.bucket ==> será retornado o nome do bucket.
# 
resource "aws_s3_bucket" "my-bucket-import-vera" {
  bucket = "bucket-vera-import"
  tags   = var.tagsi
}

resource "aws_s3_bucket_acl" "my-bucket-import-vera-acl" {
  bucket = aws_s3_bucket.my-bucket-import-vera.id
  acl    = "private"
}

data "aws_iam_policy_document" "my-iam-policy-s3-import" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.my-bucket-import-vera.arn,
      "${aws_s3_bucket.my-bucket-import-vera.arn}/*",
    ]
  }
}

#resource "aws_s3_bucket_policy" "my-object-policy-s3-import" {
#  bucket = aws_s3_bucket.my-iam-policy-s3-import.id
#  policy = data.aws_iam_policy_document.my-iam-policy-s3-import.json
#}