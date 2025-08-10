terraform {
  backend "s3" {
    bucket = "demo_buc"  #Name fo the s3 bucket 
    region = "ap-south-1a"
    key = "terraform.tfstate" #path within bucket where the ste
    dynamodb_table = "terraform-state-lock-dynamo"  #DynamoDB table used for state
    encrypt = true  #ensures the state is encrpted at rest in s3
    
  }
}