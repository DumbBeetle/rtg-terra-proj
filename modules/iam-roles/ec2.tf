resource "aws_iam_role" "github_ec2_role" {
  name = "GitHub-EC2-Role"
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
            "token.actions.githubusercontent.com:sub" : "repo:${var.github_repo}:ref:${var.github_branches.compute}",
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "github_ec2_policy" {
  name = "GitHub-EC2-Policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action : [
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceStatus",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs",
          "ec2:CreateTags",
          "ec2:DescribeImages",
          "ec2:RunInstances",
          "ec2:TerminateInstances"
        ],
        Effect   = "Allow"
        Resource = "*"
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

resource "aws_iam_role_policy_attachment" "attach_github_ec2_policy" {
  role       = aws_iam_role.github_ec2_role.name
  policy_arn = aws_iam_policy.github_ec2_policy.arn
}

