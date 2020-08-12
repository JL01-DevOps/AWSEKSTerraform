terraform {
  backend "s3" {
    bucket = "jlongmuir-terraform-remote-state-storage-s3"
    key    = "env/terraform.tfstate"
    region = "eu-west-2"
  }
}
