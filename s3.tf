module "s3_bucket" {

  source = "./modules/storage"

  bucket = "my-s3-bucket"
  acl    = "private"

  versioning = {
    enabled = false
  }

}

  #zs:skip=ZS-AWS-00035 This is a test