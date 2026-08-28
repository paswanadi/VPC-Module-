output "vpc_id" {
    value = aws_vpc.Y.id 
    description = "ID of the created VPc"
}

output "public_subnet_ids" {
value = [for s in aws_subnet.public : s.id]
description = "List of public subnets IDs for use by compute resources"
}

output "private_subnet_id" {
    value = [for s in aws_subnet.private : s.id]
    description = "List of Private subnets"
}