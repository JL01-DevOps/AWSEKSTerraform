terraform {
  backend "s3" {
    bucket = "jlongmuir-terraform-remote-state-storage-s3-oregon"
    key    = "terraform-eks.tfstate"
    region = "us-west-2"
  }
}
