# AWS Environment Setup Script

This repository contains a script that automates the setup of an AWS environment with space-themed names for subnets, security groups, and EC2 instances. The script creates a VPC, subnets, security groups, and launches EC2 instances with the specified configurations.

## Prerequisites

- AWS CLI installed and configured with valid access keys.
- An existing AWS key pair for EC2 instance access.

## Installation

### AWS CLI

If you don't have the AWS CLI installed, you can install it using Homebrew (for macOS and Linux):

```shell
brew install awscli
```

For other platforms, please refer to the official AWS CLI documentation for installation instructions: [Installing the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-quickstart-installation).

## Usage

1. Ensure the AWS CLI is properly installed and configured with your access keys.

2. Replace the placeholder values in the script:
   - `YOUR_AWS_ACCESS_KEY` and `YOUR_AWS_SECRET_KEY` with your AWS access keys.
   - `YOUR_KEY_PAIR_NAME` with the name of your AWS key pair.

3. Make the script executable:
```shell
chmod +x aws_setup_script.sh
```

4. Run the script:
```shell
./aws_setup_script.sh
```

## Script Overview

The script performs the following actions:

1. Creates a VPC with the name "MissionControl" and CIDR block "10.0.0.0/16".

2. Creates two subnets:
   - "MoonBase" with the CIDR block "10.0.0.0/24".
   - "MarsColony" with the CIDR block "10.0.1.0/24".

3. Creates two security groups:
   - "MoonShield" with inbound SSH rule from any IP address.
   - "MarsShield" with inbound SSH rule from any IP address.

4. Launches two EC2 instances:
   - Instance 1 in the "MoonBase" subnet with the "MoonShield" security group.
   - Instance 2 in the "MarsColony" subnet with the "MarsShield" security group.

## Important Note

These resources may incur cost depending on your AWS account type. Please take note and ensure you know what you are doing before running the script.

