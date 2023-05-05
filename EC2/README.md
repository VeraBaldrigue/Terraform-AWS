## Para executar em dev:
terraform apply -var-file="./inventories/dev/terraform.tfvars" -var="env=dev"
## Para executar em hom:
terraform apply -var-file="./inventories/hom/terraform.tfvars" -var="env=hom"
## Para executar em prod:
terraform apply -var-file="./inventories/prod/terraform.tfvars" -var="env=prod"
