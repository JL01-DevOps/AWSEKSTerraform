terraform {
  backend "s3" {
    bucket = "jlongmuir-terraform-remote-state-storage-s3"
    key    = "terraform-eks.tfstate"
    region = "eu-west-2"
  }
}
