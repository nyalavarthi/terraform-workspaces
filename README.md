<h2> Terrafrom workspaces example for AWS S3</h2>

Terraform commands required to run this project

```
#initialize env specific workspace , pass appropriate backend file as argument. 
terraform init -backend-config=backends/prod-env.tf

#create new workspace ( from command line)
terraform workspace new "dev"
 
#change to an existing workspace
terraform workspace select "dev"
 
#then run terraform init, plan & apply as you would normally do in any terraform project
terraform plan 
terraform apply
```
