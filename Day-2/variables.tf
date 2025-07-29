variable "ami_id" {
    description = "inserting ami value"
    type = string
    default = "ami-0d0ad8bb301edb745"
  
}

variable "type" {
    type = string
    default = "t2.micro"
  
}

variable "key" {
    type = string
    default = "aws_login_demo"
  
}