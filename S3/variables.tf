variable "tags" {
  type        = map(string)
  description = "aws s3 tags"
  default = {
    variable-var1 = "first-bucket-Vera"
    variable-var2 = "Dev"
    variable-var3 = "ManagedBy-Terraform"
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