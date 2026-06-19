data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "site_deploy" {
  name        = "${var.project_name}-${var.environment}-deploy"
  description = "Allows CI/CD to upload site assets and invalidate CloudFront."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DeploySiteObjects"
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = [
          aws_s3_bucket.site.arn,
          "${aws_s3_bucket.site.arn}/*"
        ]
      },
      {
        Sid    = "InvalidateCloudFront"
        Effect = "Allow"
        Action = [
          "cloudfront:CreateInvalidation",
          "cloudfront:GetInvalidation"
        ]
        Resource = aws_cloudfront_distribution.site.arn
      }
    ]
  })
}
