provider "aws" {
    access_key = ""
    secret_key = ""
    region= "us-east-2"
}

resource "aws_instance" "MyFirstInstance" {
    ami = "ami-0ee4f2271a4df2d7d"
    instance_type = "t2.micro"
}