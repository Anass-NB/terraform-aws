
# Terraform EC2 Module (YAML-driven)

Provision an EC2 instance by editing a single **`ec2-config.yaml`** file.


## Quick start

```bash
# 1. Edit ec2-config.yaml with your AMI, subnet, SG IDs
# 2. Edit variables.tf with your region 

terraform init
terraform plan
terraform apply
```

## ec2-config.yaml reference

| Key | Type | Description |
|-----|------|-------------|
| `name` | string | Unique logical name (used as `Name` tag) |
| `ami` | string | AMI ID |
| `instance_type` | string | e.g. `t3.medium` |
| `key_name` | string | EC2 key pair name |
| `subnet_id` | string | Target subnet |
| `associate_public_ip` | bool | Assign public IP? |
| `root_volume.size` | number | Root volume size in GB |
| `root_volume.type` | string | `gp3`, `gp2`, `io2`, etc. |
| `root_volume.encrypted` | bool | Encrypt root volume |
| `security_group_ids` | list | SG IDs to attach |
| `iam_instance_profile` | string | IAM profile name (or `""` to skip) |
| `tags` | map | Instance-specific tags merged with global tags |


## Reference
- [Terraform AWS EC2 resource docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#example-usage)