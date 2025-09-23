output "namespace_name"{
    value = aws_redshiftserverless_namespace.redshift_namespace.namespace_name
    description = "The Redshift Namespace Name."

}