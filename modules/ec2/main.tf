locals {
  ec2_config = yamldecode(file("ec2-config.yaml"))
}


module "compute" {
  source        = "./compute"
  name                 = local.ec2_config.name
  ami                  = local.ec2_config.ami
  instance_type        = local.ec2_config.instance_type
  key_name             = local.ec2_config.key_name
  subnet_id            = local.ec2_config.subnet_id
  associate_public_ip  = local.ec2_config.associate_public_ip
  root_volume          = local.ec2_config.root_volume
  security_group_ids   = local.ec2_config.security_group_ids
  tags                 = local.ec2_config.tags

}
