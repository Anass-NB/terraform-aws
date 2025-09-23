locals {
  redshift_config = yamldecode(file("redshift_config.yaml"))
}



module "storage" {
  source        = "./modules/storage"
  buckets_names = ["anb1-tf-fubcket", "anb2-tf-fubcket"]

}

# module "iam"{
#   source = "./modules/iam"
# }


module "ecr" {
  source = "./modules/ecr"

}
module "redshift" {
  source          = "./modules/redshift"
  redshift_config = local.redshift_config
}
