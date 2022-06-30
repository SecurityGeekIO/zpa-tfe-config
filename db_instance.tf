resource "aws_kms_key" "km_db_kms_key" {
    description = "KMS Key for DB Instance ${var.environment}"
    deletion_window_in_days = 10
    enable_key_rotation =    true

    tags = merge(var.default_tags, {
        Name = "kms_db_kms_key_${var.environment}"
    })
}

resource "aws_db_instance" "km_db" {

    name = "km_db_${var.environment}"
    allocated_storage = 20
    engine = "postgres"
    engine_version = "10.6"
    instance_class = "db.t3.medium"
    storage_type = "gp2"
    backup_retention_period = "35"
    storage_encrypted = false
}


#zs:skip=ZS-AWS-00032 Ignore for Testing
#zs:skip=ZS-AWS-00013 Ignore for Testing
# Ensure that backup retention is enabled for RDS Instances (HIGH)ZS-AWS-00032
# Ensure that encryption is enabled for RDS PostgreSQL Instances (HIGH)ZS-AWS-00013