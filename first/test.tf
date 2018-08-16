provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}


terraform {
	required_version = "~> 0.9.8"
  	backend "s3" {
    bucket = "glowing-sigma-terraform-state"
    key    = "dev/terraform.tfstate"
    access_key = "AKIAJLRCG2VXKQW2L44A"
  	secret_key = "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"
  	region     = "ap-south-1"
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