## terraform-aws-vpc

A reusable Terraform module that builds a VPC with public and private subnets across multiple availability zones. Written for ap-southeast-2, works in any region.

## Public subnets route to the internet through an Internet Gateway. Private subnets have no outbound route — no NAT Gateway, no hourly cost.

Requirements
Name	Version
terraform	>= 1.5.0
aws provider	~> 5.0

## DNS enabled. enable_dns_hostnames and enable_dns_support are both on. Required if you plan to use private hosted zones or VPC endpoints later.

## Cost

## Everything this module creates is free: VPC, subnets, Internet Gateway, route tables. Charges only start when you attach compute or a NAT Gateway.

# Testing
bash
terraform init
terraform validate
terraform plan