resource "aws_instance" "name" {
    ami ="ami-0d0ad8bb301edb745"
    instance_type = "t2.nano"
    key_name ="aws_login_demo" 
    tags = {
        Name = "Demo"
    }
  
}