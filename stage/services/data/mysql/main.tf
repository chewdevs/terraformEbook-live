terraform {
  backend "s3" {
    bucket = "ebook-terraform"
    key    = "stage/services/data/mysql/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}

provider "aws"{
  region = "us-east-1"
}

module "mysql"{
  source = "../../../../modules/services/data/mysql"

  db_name = "dbstage"
  db_password = "Toto123!"
}
