
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
