#Some of these variable maps are not applicable for S3, they are provided as an example.
variable "workspace_to_environment_map" {
  type = "map"
  default = {
    dev = "dev"
    qa  = "qa"
    prd = "prd"
  }
}

variable "subnet_map" {
  description = "A map from environment to a list of the subnets"
  type        = "map"
  default = {
    dev = "subnet-1"
    qa  = "subnet-2"
    prd = "subnet-3"
  }
}

variable "ami_map" {
  description = "A map from environment to a list of the AMIs"
  type        = "map"
  default = {
    dev = "ami-00072e18ac03417dc"
    qa  = "ami-00072e18ac03417dc"
    prd = "ami-0df0e7600ad0913a9"
  }
}

variable "instance_class_map" {
  description = "A map from environment to a list of the ec2 instance types"
  type        = "map"
  default = {
    dev = "t2.nano"
    qa  = "t2.medium"
    prd = "t2.large"
  }
}

variable "vpc_map" {
  description = "A map from environment to a list of the VPC ids"
  type        = "map"
  default = {
    dev = "vpc-2"
    qa  = "vpc-3"
    prd = "vpc-2"
  }
}

variable "cidr_block_map" {
  description = "A map from environment to a list CIDR blocks"
  type        = "map"
  default = {
    dev = "0.0.0.0/0"
    qa  = "0.0.0.0/0"
    prd = "0.0.0.0/0"
  }
}

variable "log_bucket_map" {
  description = "A map from environment to a list Log bucket names"
  type        = "map"
  default = {
    dev = "my-tf-test-bucket-1-dev"
    qa  = "my-tf-test-bucket-1-qa"
    prd = "my-tf-test-bucket-1-prd"
  }
}

locals {
  environment    = "${lookup(var.workspace_to_environment_map, terraform.workspace, "dev")}"
  subnet         = "${var.subnet_map[local.environment]}"
  ami            = "${var.ami_map[local.environment]}"
  instance_class = "${var.instance_class_map[local.environment]}"
  cidr_block     = "${var.cidr_block_map[local.environment]}"
  vpcid          = "${var.vpc_map[local.environment]}"
  log_bucket     = "${var.log_bucket_map[local.environment]}"

}
