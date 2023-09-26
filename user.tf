resource "aws_instance" "ubuntu" {
  instance_type          = var.instance_type
  ami                    = var.instance_ami
  vpc_security_group_ids = [aws_security_group.User-Jenkins_SG.id]
  tags = {
    Name = var.instance_name
  }

  user_data = file("user.sh")
}

resource "aws_security_group" "User-Jenkins_SG" {
  name        = var.security_group_name
  description = "Inbound rules for security group"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "incoming 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "incoming 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "outbound rules"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "user-jenkins_bucket" {
    # Use the generated random hexadecimal string, convert to lowercase, and replace invalid characters with hyphens
    bucket = "user-jenkins-bucket-${try(replace(random_id.randomsss.hex, "/[^a-z0-9-]/", "-"), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")}"

    tags = {
        Name = "user-jenkins_bucket"
    }
}

resource "random_id" "randomsss" {
    byte_length = 10
}
