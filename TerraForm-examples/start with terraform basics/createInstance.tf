provider "aws" {
    access_key = "AKIAWXTBU4GQJD5THGVN"
    secret_key = "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"
    region= "us-east-2"
}

resource "aws_instance" "MyFirstInstance" {
    ami = "ami-0ee4f2271a4df2d7d"
    instance_type = "t2.micro"
}