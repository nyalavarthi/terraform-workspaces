#hard coded variables are replaced by local variables. ( variables.tf)
resource "aws_s3_bucket" "b" {
  bucket = "ny-tf-bucket-${local.environment}-001"
  acl    = "private"
  region   = "us-east-1"
   
  tags = {
    Name        = "My S3 test bucket"
    Environment = local.environment
    Owner       = "Narendra Yala",
    DataType    = "Test files"  
  }
   
  logging {
    target_bucket = local.log_bucket
    target_prefix = "s3logs/us-east-1/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.mykey.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }
    
}