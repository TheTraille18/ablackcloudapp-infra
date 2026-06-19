variable "aws_region" {
  description = "Primary AWS region for S3 and other regional resources."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short project name used in resource names and tags."
  type        = string
  default     = "ablackcloudapp"
}

variable "environment" {
  description = "Deployment environment (e.g. prod, staging)."
  type        = string
  default     = "prod"
}

variable "site_bucket_name" {
  description = "Globally unique S3 bucket name for the static site."
  type        = string
  default     = "ablackcloudapp.com"
}

variable "price_class" {
  description = "CloudFront price class."
  type        = string
  default     = "PriceClass_100"
}

variable "enable_versioning" {
  description = "Enable S3 bucket versioning."
  type        = bool
  default     = true
}
