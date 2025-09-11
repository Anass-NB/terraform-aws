# IaC using terraform in AWS
This repository contains terraform code to create and manage AWS resources using Infrastructure as Code (IaC) principles. The code is organized into modules for better reusability and maintainability.

## Storage 
the s3 module servs to create an s3 bucket , the name of the bucket is given in the s3_config.yaml file in the s3 module directory

## Identity and Access Management 
the iam module servs to create an iam user and an iam group , the name of the user and group is given in the iam_config.yaml file in the iam module directory

## Elastic Container Registry
the ecr module servs to create an ecr repository , the name of the repository is given in the ecr_config.yaml file in the ecr module directory
