# resource "aws_db_instance" "default" {
#     allocated_storage = 10
#     db_name = "mydb"
#     engine = "mysql"
#     multi_az = true
#     db_subnet_group_name = aws_db_subnet_group.sub_grp.id
#     engine_version = "8.0"
#     instance_class = "db.t3.micro"
#     username = "foo"
#     password = "foobarbaz"
#     parameter_group_name = "default.mysql8.0"
#     skip_final_snapshot = true

  
# }

# resource "aws_db_subnet_group" "sub_grp" {
#     name = "mycustsubnet"
#     subnet_ids = ["subnet-", "subnet-"]

#     tags = {
#       Name = "my Db subnet group"
#     }
  
# }