resource "aws_security_group" "sg" {
    name = "kms_rds_sg"
    vpc_id = var.vpc_id
    tags = merge(var.default_tags, {
        Name = "km_rds_sg_${var.environment}"
    })
    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}