# Will fetch all aws availability_zones from AWS and put it in variable "aws_availability_zones"
data "aws_availability_zones" "available" {}

data "aws_ami" "latest_ubuntu" {
  # fetch most recent ubuntu AMI
  most_recent = true
  # owner if can be found -> google find aws ami (there you can see AMIs with owner IDs) 
  owner = ["09972..."]

  filter {
    name = "name"
    values = "ubuntu(images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*)"
  }

  filter {
    name = "virtualization-type"
    values = "hvm"
  }
}

resource "aws_instance" "MyFirstInstnace" {
  # lookup on AMIs on basis of AWS_REGION
  ami           = data.aws_ami.latest_ubuntu
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.names[1] # availability_zone at index 1 

  tags = {
    Name = "custom_instance"
  }
}