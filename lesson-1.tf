provider "aws" {
    region = var.region
    access_key = var.secret_key
    secret_key = var.secret_id
}

resource "aws_instance" "my_web_server" {
      ami = "ami-0ea3405d2d2522162"
        instance_type = "t2.micro"
        vpc_security_group_ids = [aws_security_group.my_web_server.id]
        user_data = file("user_data.sh")
    tags = {
        Name = "Web Server Build by terraform"
        Owner = "Valentine Kravtsov"
    }
    
    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_security_group" "my_web_server" {
    name = "my_web_server"
    description = "My_First_sec_group"
  


    ingress {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        protocol = "tcp"
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
}
