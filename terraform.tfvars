# Prefix for resource names
prefix = "my-customer-prefix"

# Environment (e.g., development, production)
environment = "production"

# Tags for resources
tags = {
  "Owner"      = "Dhruv"
  "Project"    = "AWS Infrastructure"
  "Department" = "IT"
}

# Launch template name
name = "my-launch-template"

# User data (optional)
user_data = <<-EOF
  #!/bin/bash
  echo "Hello, world!"
EOF

# EBS Optimized instance (true or false)
ebs_optimized = true

# AMI ID (Amazon Machine Image ID)
ami_id = ""

# Instance type (e.g., t3.micro, t2.medium)
instance_type = "t3.medium"

# EC2 Key name for SSH access
key_name = ""

# VPC Security Group IDs
vpc_security_group_ids = [""]

# Default version of the launch template
launch_template_default_version = "1"

# Update the launch template default version on each update
update_launch_template_default_version = true

# Disable API termination (true or false)
disable_api_termination = true

# Instance initiated shutdown behavior (stop or terminate)
instance_initiated_shutdown_behavior = "stop"

# Kernel ID (optional)
kernel_id = ""

# RAM disk ID (optional)
ram_disk_id = ""

# Block device mappings (optional)
block_device_mappings = [
  {
    device_name = "/dev/sda1"
    volume_size = 50
    volume_type = "gp2"
    delete_on_termination = true
  }
]

# Capacity reservation specification (optional)
capacity_reservation_specification = {
  capacity_reservation_preference = "open"
}

# CPU options (optional)
cpu_options = {
  core_count       = 2
  threads_per_core = 2
}

# Credit specification (optional, for T2 instances)
credit_specification = {
  cpu_credits = "unlimited"
}

# Elastic GPU specifications (optional)
elastic_gpu_specifications = {
  type = "g3.8xlarge"
}

# Elastic inference accelerator (optional)
elastic_inference_accelerator = {
  type = "eia2.medium"
}

# Enclave options (optional)
enclave_options = {
  enabled = true
}

# Hibernation options (optional)
hibernation_options = {
  configured = true
}

# IAM instance profile (optional)
iam_instance_profile = {
  name = "my-instance-profile"
}

# Instance market options (optional, e.g., for Spot instances)
instance_market_options = {
  market_type = "spot"
  spot_options = {
    block_duration_minutes = 60
    instance_interruption_behavior = "terminate"
    max_price = "0.05"
  }
}

# License specifications (optional)
#license_specifications = [
#  {
#    license_configuration_arn = ""
#  }
#]

# Metadata options (optional)
metadata_options = {
  http_endpoint = "enabled"
  http_tokens = "required"
  http_put_response_hop_limit = 2
}

# Enable detailed monitoring (true or false)
enable_monitoring = true

# Network interfaces (optional)
network_interfaces = [
  {
    associate_public_ip_address = true
    subnet_id = "subnet-0aca4c58f1efb3a9e"
    delete_on_termination = true
    security_groups = ["sg-02ce85fd9831ad4f1"]
  }
]

# Placement (optional)
placement = {
  availability_zone = "us-west-1a"
  tenancy = "default"
}

# Launch template tags (optional)
launch_template_tags = {
  "Environment" = "Production"
}
