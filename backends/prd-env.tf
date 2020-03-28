# if you have multiple projects, remember to change they bucket key name accordingly, 
# do not reuse the same key for all the projects and it overwrites your previous state information
bucket = "prd-bucket-terraform-state"
key    = "tf-state/workspaces.tfstate"
region = "us-east-1"