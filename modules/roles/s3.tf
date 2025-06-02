resource "aws_iam_role" "github_s3_role" {
  name = "GitHub-S3-Role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::${var.github_account_id}:oidc-provider/token.actions.githubusercontent.com"
        }
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "token.actions.githubusercontent.com:sub" : "repo: <aws-samples/EXAMPLEREPO>:ref:refs/heads/<ExampleBranch>",
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "github_s3_policy" {
  name = "GitHub-S3-Policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Effect = "Allow"
        Resource = [
          var.s3_bucket_arn,
          "${var.s3_bucket_arn}/*"
        ]
        # Limit access only to the specific vpc
        "Condition" : {
          "StringEquals" : {
            "aws:SourceVpc" : var.vpc_id
          }
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_github_s3_policy" {
  role       = aws_iam_role.github_s3_role.name
  policy_arn = aws_iam_policy.github_s3_policy.arn
}

