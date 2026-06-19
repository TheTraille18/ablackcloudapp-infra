output "aws_account_id" {
  description = "AWS account ID."
  value       = data.aws_caller_identity.current.account_id
}

output "site_bucket_name" {
  description = "S3 bucket for static site assets. Use in GitHub Actions / deploy scripts."
  value       = aws_s3_bucket.site.id
}

output "site_bucket_arn" {
  description = "ARN of the site bucket."
  value       = aws_s3_bucket.site.arn
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID for cache invalidation."
  value       = aws_cloudfront_distribution.site.id
}

output "cloudfront_domain_name" {
  description = "CloudFront URL for the deployed site."
  value       = aws_cloudfront_distribution.site.domain_name
}

output "deploy_policy_arn" {
  description = "IAM policy ARN to attach to a CI/CD role or user."
  value       = aws_iam_policy.site_deploy.arn
}
