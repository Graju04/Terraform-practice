resource "aws_instance" "name" {
    ami = "ami-0d0ad8bb301edb745"
    instance_type = "t2.micro"
    key_name = "aws_login_demo"
    #availability_zone = "south-east-1a"
    tags = {
      Name = "dev"
    }
  
}

# resource "aws_instance" "name" {
#     ami = "ami-0d0ad8bb301edb745"
#     instance_type = "t2.micro"
#     key_name = "aws_login_demo"
#     availability_zone = "ap-south-1a"
#     tags = {
#       Name = "dev"
#     }
  
# }

# resource "aws_s3_bucket" "dev" {
  
# }