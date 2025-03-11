variable "instance_type" {
  default = "t2.micro"
}

variable "region" {
  default = "us-east-1"
}

variable "key_pair_name" {
  default = "projet-devops"
}

variable "instance_count" {
  default = 3
}

variable "ami_id" {
  # Debian 12
  default = "ami-064519b8c76274859"
}
