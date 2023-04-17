# IAAC (Infra As A Code)
## Terraform AWS  :construction: Projeto em construção :construction:
## Para executar em dev:
terraform apply -var-file=".invetories/dev/terraform.tfvars" -var="env=dev"
## Para executar em dev:
terraform apply -var-file=".invetories/hom/terraform.tfvars" -var="env=hom"
## Para executar em dev:
terraform apply -var-file=".invetories/prod/terraform.tfvars" -var="env=prod"
