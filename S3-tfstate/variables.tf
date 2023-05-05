variable "tagstfstate" {
  type        = map(string)
  description = "aws s3 tfstate tags"
  default = {
    "Exercício"   = "Criando Remote State S3"
  }
}