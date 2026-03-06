resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
#   subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip
  vpc_security_group_ids      = var.security_group_ids

  root_block_device {
    volume_size           = var.root_volume.size
    volume_type           = var.root_volume.type
    encrypted             = var.root_volume.encrypted
    delete_on_termination = true

  }


  lifecycle {
    ignore_changes = [ami]   # Prevent drift on AMI updates without explicit change
  }
}



