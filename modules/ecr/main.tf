locals {
  ecr_config = yamldecode(file("${path.module}/ecr_config.yaml"))
}



resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = local.ecr_config.ecr_name
  image_tag_mutability = local.ecr_config.ecr_tag_mutability # or "IMMUTABLE" based on your requirement
  image_scanning_configuration {
    scan_on_push = local.ecr_config.ecr_scan_on_push
  }
  tags = local.ecr_config.tags

}
