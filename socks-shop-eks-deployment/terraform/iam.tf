resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action   = "sts:AssumeRole"
        Effect   = "Allow"
        Sid      = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "test_policy"
    policy = jsonencode({
      Version   = "2012-10-17"
      Statement = [
        {
          Action   = [
            "ec2:Describe*",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }
}