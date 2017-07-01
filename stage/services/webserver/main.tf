terraform {
  backend "s3" {
    bucket = "ebook-terraform"
    key    = "stage/services/webserver/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}

provider "aws"{
  region = "eu-west-1"
}

module "webserver"{
  source = "../../../modules/services/webserver"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "ebook-terraform"
  db_remote_state_key    = "stage/services/data/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}
