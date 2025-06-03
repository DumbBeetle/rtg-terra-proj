# Project
Created a baseline for the project:
- Created VPC
- Created Modules

--------
Modules
--------
IAM_Roles:
- Use modules EC2_Role, Net_Role, S3_Role to creates a set of AWS IAM Role and Policy for EC2, VPC, S3
```
    GitHub_ec2_role: used for deploying compute resources.
    GitHub_net_role: used for designing and provisioning the network infrastructure.
    GitHub_s3_role: used for backing up the tfstate file to AWS.
```
S3_Bucket:
- Creates an S3 bucket for storage of tfstate files.