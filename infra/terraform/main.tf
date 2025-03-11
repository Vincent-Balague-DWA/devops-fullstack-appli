resource "aws_vpc" "projet_devops_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow HTTP/S and SSH inbound"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["88.160.144.47/32"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "serveurs" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  security_group_ids = [aws_security_group.allow_web.id]

  tags = {
    Name = "serveur-${count.index + 1}"
  }
}
