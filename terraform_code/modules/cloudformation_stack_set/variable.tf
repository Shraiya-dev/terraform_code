variable "iam_roles_development_template_path" {
  description = "File path for IAM roles CloudFormation template"
  type        = string
}

variable "iam_roles_deployment_template_path" {
  description = "File path for IAM roles CloudFormation template"
  type        = string
}

variable "development_administration_role_arn" {
  description = "ARN of the administrator role"
  type        = string
}

variable "deployment_administration_role_arn" {
  description = "ARN of the administrator role"
  type        = string
}