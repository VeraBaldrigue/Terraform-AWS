locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Project   = "Curso Terraform com AWS"
    ManagedBy = "terraform"
    Owner     = "Vera Baldrigue"
  }
  dir    = "C:/Vera/Terraform/"
  fileup = "arquivo_teste_upload_s3.json"
}