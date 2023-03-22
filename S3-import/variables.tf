
variable "tagsi" {
  type        = map(string)
  description = "aws s3 import tags"
  default = {
    "Owned"         = "Vera Baldrigue"
    "ManagedBy"     = "Terraform"
    "Imported_into" = "22/03/2023"
  }
}