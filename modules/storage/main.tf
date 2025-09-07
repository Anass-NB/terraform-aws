resource "aws_s3_bucket" "s3_buckets" {
  for_each = toset(var.buckets_names)
  bucket   = each.value
}


output "bucket_ids" {
  value = [for b in aws_aws_s3_bucket.s3_buckets : b.id]
}
