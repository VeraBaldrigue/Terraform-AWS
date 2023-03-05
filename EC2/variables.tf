variable region {
    type = string
    description = "Region onde será criada a máquina virtual"
    default = "us-east-1"
}
variable ami {
    type = string
    description = "aws ami instance "
    default = "ami-0dfcb1ef8550277af"
}
variable instance_type {
    type = string
    description = "aws instance type"
    default = "t2.micro"
}
variable tags {
    type = map(string)
    description = "aws instance tags"
    default = {    
    Name = "tag-aws-instance-vera"
    Finalidade = "curso terraform"
    }
}