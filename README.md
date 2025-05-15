# terraform-aws-template

This Terraform module creates an **AWS EC2 Launch Template** with flexible options to support a wide variety of use cases, including EBS optimization, spot instance configuration, custom user data, IAM roles, metadata options, and more. It is intended to be used as a foundational building block for launching EC2 instances or configuring Auto Scaling Groups (ASGs) in production environments.

---

## Introduction

This module provisions a highly customizable and reusable AWS EC2 Launch Template that serves as the base configuration for launching EC2 instances. 

### Intended Users

- DevOps and infrastructure engineers who want to manage EC2 instance configurations via Infrastructure as Code (IaC).
- Platform teams looking to standardize EC2 deployments with reusable templates.
- Users provisioning Auto Scaling Groups, EKS node groups, or ECS capacity providers.

---

## Resources Created and Managed by This Module

- `aws_launch_template`: The core resource which defines the EC2 instance configuration including:
  - AMI ID
  - Instance type
  - Block device mappings
  - IAM instance profile
  - Security groups
  - Key pair
  - User data
  - Metadata options
  - Spot instance options
  - Monitoring and shutdown behavior
  - Tag specifications

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `ami_id` | AMI ID to launch the instance from | `string` | `null` | yes |
| `instance_type` | Type of EC2 instance (e.g., t3.micro) | `string` | `null` | yes |
| `name_prefix` | Prefix for the launch template name | `string` | `""` | no |
| `key_name` | Name of the SSH key pair | `string` | `null` | no |
| `vpc_security_group_ids` | List of security group IDs | `list(string)` | `[]` | no |
| `user_data` | Base64-encoded user data script | `string` | `null` | no |
| `iam_instance_profile_arn` | ARN of IAM instance profile | `string` | `null` | no |
| `block_device_mappings` | EBS block device configuration | `map(any)` | `{}` | no |
| `spot_options` | Spot instance settings (e.g., max_price, interruption_behavior) | `map(any)` | `{}` | no |
| `metadata_options` | EC2 metadata settings | `map(any)` | `{}` | no |
| `monitoring` | Enables detailed monitoring | `bool` | `true` | no |
| `ebs_optimized` | Whether to use EBS optimization | `bool` | `null` | no |
| `tags` | Common tags to apply | `map(string)` | `{}` | no |
| `launch_template_tags` | Additional tags only for launch template | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `launch_template_id` | ID of the created launch template |
| `launch_template_name` | Name of the created launch template |
<!-- END_TF_DOCS -->

---

## Example Usage

```hcl
module "launch_template" {
  source = "git::https://github.com/tothenew/terraform-aws-launch-template.git"

  name_prefix       = "webserver"
  ami_id            = "ami-0abcdef1234567890"
  instance_type     = "t3.micro"
  key_name          = "my-key"
  user_data         = filebase64("user-data.sh")
  vpc_security_group_ids = ["sg-12345678"]
  
  block_device_mappings = {
    "root" = {
      device_name = "/dev/xvda"
      ebs = [{
        volume_size = 20
        volume_type = "gp3"
        delete_on_termination = true
      }]
    }
  }

  tags = {
    Environment = "dev"
    Project     = "launch-template"
  }
}
