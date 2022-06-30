resource "aws_security_group" "sg" {
    #zs:skip=ZS-AWS-00053 Ignore for Testing
    #zs:skip=ZS-AWS-00054 Ignore for Testing
    name = "kms_rds_sg"
    vpc_id = var.vpc_id
    tags = merge(var.default_tags, {
        Name = "km_rds_sg_${var.environment}"
    })
    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["1.1.1.1/32"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

