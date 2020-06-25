provider "aws" {
    region = var.region
    access_key = var.secret_key
    secret_key = var.secret_id
}


resource "aws_instance" "my_ubuntu" {
    count = 1
    ami = "ami-089cc16f7f08c4457"
    instance_type = "t2.micro"
}

resource "aws_instance" "my_linux" {
    count = 1
    ami = "ami-0ea3405d2d2522162"
    instance_type = "t2.micro"
}