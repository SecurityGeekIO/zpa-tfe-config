module "s3_bucket" {
  #zs:skip=ZS-AWS-00035 This is a test
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket"
  acl    = "private"

  versioning = {
    enabled = true
  }

}