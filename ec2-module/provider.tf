provider "vault" {

  address = "http://172.31.89.193:8200"
  skip_tls_verify = true
  token = "hvs.bf8mleOcB1L3QUPmhxVGAcZw"
}

provider "aws" {
  region = "us-east-1"
}