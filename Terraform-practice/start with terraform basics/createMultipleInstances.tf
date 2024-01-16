# create multiple instances
resource "aws_instance" "MyFirstInstance" {
  count         = 3
  ami           = "ami-0ee4f2271a4df2d7d"
  instance_type = "t2.micro"

  tags = {
    Name = "demoinstance-${count.index}"
  }
}


# terraform init
# terraform plan
# terraform apply - Apply Terrform file