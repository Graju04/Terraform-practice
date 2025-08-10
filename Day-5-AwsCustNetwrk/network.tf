#creating VPC
resource "aws_vpc" "prod" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "prod_vpc"
    }
  
}

#creating subnet
resource "aws_subnet" "prod" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "prod_subnet"
    }
  
}

#creating private subnet
resource "aws_subnet" "prod_private" {
    vpc_id = aws_subnet.prod.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "private_subnet"
    }
  
}

#creating internetgateway
resource "aws_internet_gateway" "prod" {
    vpc_id = aws_vpc.prod.id
    tags = {
      Name = "prod_ig"
    }
  
}

#creating route table
resource "aws_route_table" "prod" {
    vpc_id = aws_vpc.prod.id

    route  {
        gateway_id = aws_internet_gateway.prod.id
        cidr_block = "0.0.0.0/0"
    }
  
}

#creating subnet association

resource "aws_route_table_association" "prod" {
    route_table_id = aws_route_table.prod.id 
    subnet_id = aws_subnet.prod.id
  
}

#create Nat Gateway for private subnet
#create route for private subnets
#create route -table association

#creating security group
resource "aws_security_group" "prod" {
    name = "prod"
    description = "allow this inbout traffic"
    vpc_id = aws_vpc.prod.id

    ingress  {
        description = "Tls from vpc"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }    
    
    ingress  {
        description = "Tls from ssh"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "prod"
    }
}

resource "aws_instance" "prod" {
    ami = "ami-0144277607031eca2"
    instance_type = "t2.micro"
    key_name = "aws_login_demo"
    subnet_id = aws_subnet.prod.id
    vpc_security_group_ids = [aws_security_group.prod.id]
    tags = {
      Name = "prod_ec2"
    }
}  
