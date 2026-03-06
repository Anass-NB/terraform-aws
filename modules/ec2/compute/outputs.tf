output "instance_id" {
  description = "The EC2 instance ID"
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = aws_instance.this.private_ip
}

output "public_ip" {
  description = "Public IP address (empty string if not assigned)"
  value       = aws_instance.this.public_ip
}

output "availability_zone" {
  description = "AZ the instance was placed in"
  value       = aws_instance.this.availability_zone
}