

#VPC module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.2.0"

  name = var.redshift_config.network.vpc.name
  cidr = var.redshift_config.network.vpc.cidr

  azs             = var.redshift_config.network.vpc.availability_zones
  private_subnets = var.redshift_config.network.subnets.private_subnets_cidrs
  public_subnets  = var.redshift_config.network.subnets.public_subnets_cidrs

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Name = var.redshift_config.network.vpc.name
  }
}

#Security Group module
module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"
  
  name        = var.redshift_config.network.security_groups.name
  description = var.redshift_config.network.security_groups.description
  vpc_id      = module.vpc.vpc_id

  # Allow ingress rules to be accessed only within current VPC
  ingress_cidr_blocks = var.redshift_config.network.security_groups.ingress_cidr_blocks

  tags = {
    Name = var.redshift_config.network.security_groups.name
  }
}

##################################
# IAM
##################################


# Create an IAM Role for Redshift
resource "aws_iam_role" "redshift_role" {
  name = "redshift-serverless-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = "redshift-role"
  }
}

# Create and assign an IAM Role Policy to access S3 Buckets
resource "aws_iam_role_policy" "redshift-s3-full-access-policy" {
  name = "redshift-serverless-role-s3-policy"
  role = aws_iam_role.redshift_role.id

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Effect": "Allow",
       "Action": "s3:*",
       "Resource": "*"
      }
   ]
}
EOF
}

# Get the AmazonRedshiftAllCommandsFullAccess policy
data "aws_iam_policy" "redshift-full-access-policy" {
  name = "AmazonRedshiftAllCommandsFullAccess"
}

# Attach the policy to the Redshift role
resource "aws_iam_role_policy_attachment" "attach-s3" {
  role       = aws_iam_role.redshift_role.name
  policy_arn = data.aws_iam_policy.redshift-full-access-policy.arn
}


##################################
# Redshift Namespace & Workgroup
##################################
resource "aws_redshiftserverless_namespace" "redshift_namespace" {
  namespace_name      = var.redshift_config.namespace.name
  db_name             = var.redshift_config.namespace.db_name
  admin_username      = var.redshift_config.namespace.admin_username
  admin_user_password = var.redshift_config.namespace.admin_user_password
  iam_roles           = [aws_iam_role.redshift_role.arn]

  tags = {
    Name = var.redshift_config.namespace.name
  }
}

resource "aws_redshiftserverless_workgroup" "redshift_workgroup" {
  depends_on         = [aws_redshiftserverless_namespace.redshift_namespace]
  namespace_name     = var.redshift_config.namespace.name
  workgroup_name     = var.redshift_config.workgroup.name
  base_capacity      = var.redshift_config.workgroup.base_capacity
  security_group_ids = [module.security-group.security_group_id]
  subnet_ids = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1],
    module.vpc.private_subnets[2]
  ]
  publicly_accessible = var.redshift_config.workgroup.publicly_accessible
  
  tags = {
    Name = var.redshift_config.workgroup.name
  }
}


