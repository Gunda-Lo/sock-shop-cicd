provider "aws" {
  region = data.vault_generic_secret.aws_creds.data["AWS_REGION"]
  access_key = data.vault_generic_secret.aws_creds.data["AWS_ACCESS_KEY_ID"]
  secret_key = data.vault_generic_secret.aws_creds.data["AWS_SECRET_ACCESS_KEY"]
}