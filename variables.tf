variable "bucket_name" {
  description = "Globally unique name for the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. production, staging, dev)"
  type        = string
}

variable "enable_versioning" {
  description = "Whether to enable S3 versioning. Required by the security-baseline policy."
  type        = bool
  default     = true
}

variable "enable_lifecycle" {
  description = "Whether to enable lifecycle rules for non-current version expiration"
  type        = bool
  default     = true
}

variable "noncurrent_version_retention_days" {
  description = "Days to retain non-current object versions before expiration"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}
