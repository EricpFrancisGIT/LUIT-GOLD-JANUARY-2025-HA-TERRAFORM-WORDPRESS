variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
  
}

variable "vpc_id" {
    description: = "The ID of the VPC where resources will be deployed"
    type        = string
}

variable "vpc_cidr" {
    description = "The CIDR block of the VPC"
    type        = string
    default     = "10.0.0.0/16"
}