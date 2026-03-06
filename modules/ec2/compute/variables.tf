variable "name" {
  description = "Logical name for this instance"
  type        = string
}

variable "ami" {
  description = "AMI ID to launch"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g. t3.medium)"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance into"
  type        = string
}

variable "associate_public_ip" {
  description = "Whether to assign a public IP address"
  type        = bool
  default     = false
}

variable "monitoring" {
  description = "Enable detailed CloudWatch monitoring"
  type        = bool
  default     = false
}

variable "root_volume" {
  description = "Root EBS volume configuration"
  type = object({
    size      = number
    type      = string
    encrypted = bool
  })
  default = {
    size      = 20
    type      = "gp3"
    encrypted = true
  }
}



variable "security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
  default     = []
}

variable "iam_instance_profile" {
  description = "IAM instance profile name (null to skip)"
  type        = string
  default     = null
}



variable "tags" {
  description = "Instance-level tags from the YAML config"
  type        = map(string)
  default     = {}
}