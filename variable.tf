variable "vpc_cidr" {
    type = string 

    description = "CIDR block for the VPC"

}

variable "public_subnet_cidrs" {
    type = map(string)
    description = "Map of AZ name to public subnets CIDR,"
}

variable "private_subnet_cidrs" {
    type = map(string)
    description = "Map of AZ name to private subnets CIDR"
}

variable "env" {
    type = string 
    description = "Environment name used for tagging and resource naming"
}