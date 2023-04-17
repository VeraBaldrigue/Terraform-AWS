variable "env" {
  type        = string
  description = "Indica onde será criada a infraestrutura"
  validation {
    condition     = var.env == "dev" || var.env == "hom" || var.env == "prod"
    error_message = "Ambiente informado não existente. Defina o ambiente como: \"dev\" ou \"hom\" ou \"prod\""
  }
}

variable "region" {
  type        = string
  description = "Region onde será criada a infraestrutura"
}

variable "instance_ami" {
  type        = string
  description = "AWS AMI Instance"
  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The instance_ami value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "instance_type_and_number" {
  type = object({
    instance_type       = string
    number_of_instances = number
  })
  description = "AWS Instance Type and number of instance to create "
}