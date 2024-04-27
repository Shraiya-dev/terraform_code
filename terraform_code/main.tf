terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.47.0"
    }
  }
}

provider "aws" {
  region = var.region 
  secret_key = var.secret_key
  access_key = var.access_key
}

# terraform {
#   backend "s3" {
#     bucket = "bucketname"
#     key    = "prod_backend/terraform.tfstate"
#     region = var.region
#   }
# }


module "custom_policies" {
  source    = "./modules/SCPS"
  for_each  = fileset(path.root, "custom-policies/*.json")
  json_file = each.value
  ou_list   = [data.aws_organizations_organizational_units.ou.id]
}

module "cloudformation_stackset" {
  source = "./modules/cloudformation_stack_set"
  iam_roles_deployment_template_path = var.iam_roles_deployment_template_path
  iam_roles_development_template_path = var.iam_roles_development_template_path
  development_administration_role_arn = var.development_administration_role_arn
  deployment_administration_role_arn = var.deployment_administration_role_arn
}
