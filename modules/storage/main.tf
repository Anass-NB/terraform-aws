resource "aws_s3_bucket" "s3_buckets" {
  for_each = toset(var.buckets_names)
  bucket   = each.value
}

