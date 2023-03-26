variable "tags" {
  type        = map(string)
  description = "aws s3 tags"
  default = {
    "ManagedBy" = "Terraform"
    "Owned"         = "Vera Baldrigue"
    "ManagedBy"     = "Terraform"
    "Ambiente" = "Dev"
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

    variable "tagstfstate" {
    type        = map(string)
    description = "aws s3 tfstate tags"
    default = {
      "TFstate"   = "Curso_Terraform"
      "ManagedBy"     = "Terraform"
    }
  }