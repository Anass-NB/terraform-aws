output "bucket_ids" {
  value = [for b in aws_s3_bucket.s3_buckets : b.id]
}
