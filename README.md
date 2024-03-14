# OpenTofu AWS EC2 Instance Project

This project uses OpenTofu to provision an AWS EC2 instance. It's designed to be run within a Docker container to ensure consistency across development environments and avoid the need to install OpenTofu and its dependencies directly on your local machine.

## Prerequisites

- Docker installed on your local machine.
- AWS Account and AWS Access Credentials configured.
- Basic knowledge of Docker, OpenTofu (or Terraform if applicable), and AWS.

## Setup

1. **Clone the Repository**

   Clone this repository to your local machine to get started with the project.

   ```bash
   git clone https://github.com/jangel97/opentofu-aws-example.git
   cd opentofu-aws-instance
   ```

2. **Build the Docker Image**

   Build the Docker image using the provided Dockerfile. This image includes OpenTofu and all required dependencies.

   ```bash
   docker build -t opentofu-ubi9 .
   ```

3. **Configure AWS Credentials**

   Ensure your AWS credentials are configured on your local machine. Typically, this involves setting up the `~/.aws/credentials` file or exporting `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` as environment variables.

   https://registry.terraform.io/providers/hashicorp/aws/latest/docs

## Running the Project

1. **Initialize OpenTofu**

   Initialize the OpenTofu project to prepare your environment.

   ```
   docker run -it --rm -v "$(pwd)"/opentofu-aws-instance:/workspace --user $(id -u) opentofu-ubi9 init
   ```

2. **Plan Infrastructure**

   Review the changes OpenTofu will make to your infrastructure without applying them.

   ```
   docker run -it --rm -v "$(pwd)"/opentofu-aws-instance:/workspace --user $(id -u) opentofu-ubi9 plan
   ```

3. **Apply Configuration**

   Apply the configuration to provision the AWS EC2 instance.

   ```
   docker run -it --rm -v "$(pwd)"/opentofu-aws-instance:/workspace --user $(id -u) opentofu-ubi9 apply
   ```

## Customization

To customize the AWS EC2 instance specifications, edit the `variables.tf` and `terraform.tfvars` files with your preferred settings, such as instance type, AMI ID, and AWS region.