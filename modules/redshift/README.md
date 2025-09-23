# ⚙️ Redshift Molecule

This Terraform module creates a redshift environemet.
## Prerequisites
To create a redshift servless environment you need :
1. IAM Role with the follwing permissions : 
    - AmazonRedshiftFullAccess
    - AmazonRedshiftServerlessFullAccess
    - AmazonS3ReadOnlyAccess
   
2. Namespace (to store data)
3. Workgroup (to run queries)
4. Network (VPC, Subnets, Security Groups)
