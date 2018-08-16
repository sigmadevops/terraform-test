provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}


terraform {
  	backend "s3" {
    bucket = "glowing-sigma-terraform-state"
    key    = "dev/terraform.tfstate"
    access_key = "${var.aws_access_key}"
  	secret_key = "${var.aws_secret_key}"
  	region     = "${var.aws_region}"
  }
}

resource "aws_s3_bucket" "TestBucket" {
  bucket = "jenkins-terraform-test"
  acl    = "private"

  tags {
    Name        = "test"
    Environment = "testing"
  }
}