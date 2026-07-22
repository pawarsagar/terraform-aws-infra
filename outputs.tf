output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "web_public_ip" {
  description = "Public IP of the web tier EC2 instance"
  value       = module.ec2.public_ip
}

output "rds_endpoint" {
  description = "Connection endpoint for the RDS instance"
  value       = module.rds.endpoint
}
