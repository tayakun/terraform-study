terraform {
  backend "s3" {
    bucket = "udemy-tayatamn-s3-tfstate"
    key    = "terraform.tfstate"
    shared_credentials_file = "~/.aws/credentials"
    region = "ap-northeast-1"
    profile = "develop-mpb"
  }
}