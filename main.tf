output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.wordpress.endpoint
}