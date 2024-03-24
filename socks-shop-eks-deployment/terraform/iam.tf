resource "aws_iam_role" "eks_worker_role" {
  name = "eks-worker-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      },
    ]
  })

  inline_policy {
    name = "ExamplePolicy"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect    = "Allow"
          Action    = "s3:GetObject"
          Resource  = "*"
        },
      ]
    })
  }

  tags = {
    Name = "eks-worker-role"
  }
}
