provider "aws" {
  region = "us-west-1"  # Specify the AWS region
}

resource "aws_dynamodb_table" "lock_files" {
  name           = "Lock-Files"  # Specify the name of the DynamoDB table
  billing_mode   = "PAY_PER_REQUEST"  # Specify the billing mode (Provisioned or Pay Per Request)
  hash_key       = "LockID"  # Specify the partition key attribute name
  attribute {
    name = "LockID"
    type = "S"  # Specify the data type of the partition key attribute (String, Number, Binary)
  }

}
