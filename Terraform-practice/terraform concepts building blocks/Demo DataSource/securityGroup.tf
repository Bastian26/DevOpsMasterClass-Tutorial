# So, this script creates a security group that allows inbound traffic on port 443 only from the AWS service EC2 IP ranges in 
# the us-east-1 and us-east-2 regions. Tags are also added based on the metadata of the retrieved IP ranges (not from outside reachable).
# So that are a lot of IPs

# Fetches ip ranges from us-east-1 and 2 (of type EC2)
data "aws_ip_ranges" "us_east_ip_range" {
    regions = ["us-east-1", "us-east-2"]
    services = ["ec2"]
}

resource "aws_security_group" "sg-custom_us_east" {
    # Name of security group
    name = "sg_custom_us_east"

    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_block = data.aws_ip_ranges.us_east_ip_range.cidr_blocks
    }

    tags = {
        CreateDate = data.aws_ip_ranges.us_east_ip_range.create_date
        SyncToken = data.aws_ip_ranges.us_east_ip_range.sync_token
    }
}

# terraform plan -var AWS_REGION="us-east-1"     - then default value will not be used
# terraform apply
