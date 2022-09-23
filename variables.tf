variable "region" {
  default =  "us-west-2"
}

variable "avalability_zone" {
  default =  "us-west-2a"
}

variable "profile" {
  default = "perdidao"
}

variable "vpn_id_security_group" {
  default = "vpc-0a7109412fae947a9"
}

variable "ami_aws_instance" {
  default = "ami-0c2ab3b8efb09f272"
}

variable "type_aws_instance" {
  default = "t2.micro"
}

variable "key_aws_instance" {
  default = "estudos-perdidao"
}

variable "default_suffix" {
  default = "-estudos-perdidao"
}

variable "db_name" {
  default = "blog"
}

variable "db_user" {
  default = "blog_owner"
}

variable "db_pass" {
  default = "!v91P80N1kM$F2wYnvbkMaK"
}

variable "ssh_key_path" {
  default = "~/.ssh/estudos-perdidao.pem"
}
