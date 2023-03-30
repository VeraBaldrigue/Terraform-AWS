    variable "tagstfstate" {
    type        = map(string)
    description = "aws s3 tfstate tags"
    default = {
      "TFstate"   = "Curso_Terraform"
      "ManagedBy"     = "Terraform"
    }
  }