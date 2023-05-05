variable "tags" {
  type        = map(string)
  description = "aws s3 tags"
  default = {
    "ManagedBy" = "Terraform"
    "Owned"     = "Vera Baldrigue"
    "Ambiente"  = "Dev"
  }
}
variable "tagsi" {
  type        = map(string)
  description = "aws s3 import tags"
  default = {
    "Test_Import"   = "Curso_Terraform"
    "ManagedBy"     = "Terraform"
    "Imported_into" = "03/03/2023"
  }
}