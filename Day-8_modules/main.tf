module "dev" {
    source = "../Day-2-basic-code-for-module-source"
    ami_id = "ami-0d0ad8bb301edb745"
    type = "t2.micro"
    key = "aws_login_demo"
}