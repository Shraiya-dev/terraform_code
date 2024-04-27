variable "region" {
  description = "region for deployment"
  type        = string
}
variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "iam_roles_development_template_path" {
  description = "File path for IAM roles CloudFormation template"
  type        = string
  default     = "templates/createIamRolesDevelopmentAccount.template"
}

variable "iam_roles_deployment_template_path" {
  description = "File path for IAM roles CloudFormation template"
  type        = string
  default     = "templates/createIamRolesDeploymentAccount.template"
}

variable "development_administration_role_arn" {
  description = "ARN of the administrator role"
  type        = string
  default     = "arn:aws:iam::746859465164:role/AdministratorRole"
}

variable "deployment_administration_role_arn" {
  description = "ARN of the administrator role"
  type        = string
  default     = "arn:aws:iam::900665950707:role/AdministratorRole"
}