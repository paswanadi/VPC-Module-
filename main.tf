terraform {
    required_version = ">= 1.5.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }
}

resource "aws_vpc" "Y" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true 
    enable_dns_support = true

    tags = {
        Name = "X-${var.env}-vpc"
        Env = var.env

    }
}

resource "aws_internet_gateway" "Y" {
    vpc_id = aws_vpc.Y.id 

    tags = {
        Name = "${var.env}-igw"
        Env = var.env
    
    }
}

resource "aws_subnet" "public" {
    for_each = var.public_subnet_cidrs 

    vpc_id = aws_vpc.Y.id 
    cidr_block = each.value 
    availability_zone = each.key
    map_public_ip_on_launch = true 

    tags = {
        Name = "${var.env}-public-${each.key}"
        Env = var.env
    }
}

resource "aws_subnet" "private" {
    for_each = var.private_subnet_cidrs 

    vpc_id = aws_vpc.Y.id 
    cidr_block = each.value 
    availability_zone = each.key

    tags = {
        Name = "${var.env}-private-${each.key}"
        Env = var.env
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.Y.id 

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Y.id

    }

    tags = {
        Name = "${var.env}-public-rt"
    }
}

resource "aws_route_table_association" "public" {
    for_each = aws_subnet.public 

    subnet_id = each.value.id 
    route_table_id = aws_route_table.public.id
}

