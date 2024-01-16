variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-2"
}

variable "Security_Group" {
    type = "list"
    default = ["sg-24076", "sg-90890", "sg-456789"]
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-05fb0b8c1424fblaa"
        us-east-2 = "ami-05fb0b8c1424f266b"
        us-west-2 = "ami-05fb0b8c1424f26ss"
        us-west-1 = "ami-05fb0b8c1424f26sX"
    }
}

# entweder nach terraform plan/apply eingeben oder mit Parametern ausführen
# terraform plan -var AWS_ACCESS_KEY="123A" -var AWS_SECRET_KEY="123A"