# ControlTower Custom CFN Resources - Create Additional IAM Role for EC2 Server with PG Changes
resource "aws_cloudformation_stack_set" "create_iam_role_ec2" {
  name                   = "create-iam-role-ec2"
  template_body          = file(var.iam_roles_development_template_path)
  execution_role_name    = "AWSCloudFormationStackSetExecutionRole"
  administration_role_arn = var.development_administration_role_arn
  operation_preferences {
    failure_tolerance_percentage = 0
    max_concurrent_percentage    = 100
  }
}

# ControlTower Custom CFN Resources - Create Additional IAM Role for Jenkins
resource "aws_cloudformation_stack_set" "create_iam_role_jenkins" {
  name                   = "create-iam-role-jenkins"
  template_body          = file(var.iam_roles_deployment_template_path)
  execution_role_name    = "AWSCloudFormationStackSetExecutionRole"
  administration_role_arn = var.deployment_administration_role_arn
  operation_preferences {
    failure_tolerance_percentage = 0
    max_concurrent_percentage    = 100
  }
}

