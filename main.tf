terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.7"
}

provider "aws" {
  profile = var.profile
  region  = var.region
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "vpc${var.default_suffix}"
  }
}

resource "local_file" "tf_ansible_vars" {
  filename = "ansible/defaults/variables.yml"
  content = <<-EOF
    db_host: "${aws_db_instance.default.address}"
    db_port: "${aws_db_instance.default.port}"
    db_name: "${var.db_name}"
    db_user: "${var.db_user}"
    db_password: "${var.db_pass}"
  EOF

  depends_on = [
    aws_db_instance.default
  ]
}

resource "aws_instance" "default" {
  ami                         = var.ami_aws_instance
  instance_type               = var.type_aws_instance
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  key_name                    = var.key_aws_instance
  monitoring                  = true
  subnet_id                   = aws_subnet.subnet_public_a.id
  associate_public_ip_address = true
  
  tags = {
    Name = "ec2-instance${var.default_suffix}"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.default.public_ip}, --private-key ${var.ssh_key_path} ansible/main.yml"
  }

  depends_on = [
    aws_db_instance.default
  ]
}

output "public_ip" {
  value = aws_instance.default.public_ip
}

