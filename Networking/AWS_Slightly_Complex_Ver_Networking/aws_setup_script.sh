#!/bin/bash

# Variables
AWS_ACCESS_KEY="YOUR_AWS_ACCESS_KEY"
AWS_SECRET_KEY="YOUR_AWS_SECRET_KEY"
REGION="ap-southeast-2"
VPC_NAME="MissionControl"
SUBNET1_NAME="MoonBase"
SUBNET2_NAME="MarsColony"
SECURITY_GROUP1_NAME="MoonShield"
SECURITY_GROUP2_NAME="MarsShield"
INSTANCE_NAME="Spaceship"

# Function to create a VPC
create_vpc() {
    VPC_ID=$(aws ec2 create-vpc \
        --cidr-block 10.0.0.0/16 \
        --query 'Vpc.{VpcId:VpcId}' \
        --output text \
        --region $REGION)
    echo "VPC ID '$VPC_ID' CREATED in '$REGION' region."

    # Add Name tag to VPC
    aws ec2 create-tags \
        --resources $VPC_ID \
        --tags "Key=Name,Value=$VPC_NAME" \
        --region $REGION
    echo "VPC ID '$VPC_ID' NAMED as '$VPC_NAME'."
}

# Function to create a Subnet
create_subnet() {
    SUBNET_ID=$(aws ec2 create-subnet \
        --vpc-id $VPC_ID \
        --cidr-block $1 \
        --query 'Subnet.{SubnetId:SubnetId}' \
        --output text \
        --region $REGION)
    echo "Subnet ID '$SUBNET_ID' CREATED in '$VPC_ID' VPC."

    # Add Name tag to Subnet
    aws ec2 create-tags \
        --resources $SUBNET_ID \
        --tags "Key=Name,Value=$2" \
        --region $REGION
    echo "Subnet ID '$SUBNET_ID' NAMED as '$2'."
}

# Function to create a Security Group
create_security_group() {
    SECURITY_GROUP_ID=$(aws ec2 create-security-group \
        --group-name $1 \
        --description "Security Group for $1" \
        --vpc-id $VPC_ID \
        --region $REGION)
    echo "Security Group ID '$SECURITY_GROUP_ID' CREATED."

    # Add Name tag to Security Group
    aws ec2 create-tags \
        --resources $SECURITY_GROUP_ID \
        --tags "Key=Name,Value=$1" \
        --region $REGION
    echo "Security Group ID '$SECURITY_GROUP_ID' NAMED as '$1'."

    # Configure security group inbound rules for SSH
    aws ec2 authorize-security-group-ingress \
        --group-id $SECURITY_GROUP_ID \
        --protocol tcp \
        --port 22 \
        --cidr 0.0.0.0/0 \
        --region $REGION
    echo "Inbound SSH rule added to Security Group ID '$SECURITY_GROUP_ID'."
}

# Function to create an EC2 instance
create_ec2_instance() {
    INSTANCE_ID=$(aws ec2 run-instances \
        --image-id ami-0f9d9a251c1a44858 \
        --count 1 \
        --instance-type t3.micro \
        --key-name YOUR_KEY_PAIR_NAME \
        --security-group-ids $1 \
        --subnet-id $2 \
        --query 'Instances[0].InstanceId' \
        --output text \
        --region $REGION)
    echo "EC2 instance ID '$INSTANCE_ID' CREATED."

    # Add Name tag to EC2 instance
    aws ec2 create-tags \
        --resources $INSTANCE_ID \
        --tags "Key=Name,Value=$INSTANCE_NAME" \
        --region $REGION
    echo "EC2 instance ID '$INSTANCE_ID' NAMED as '$INSTANCE_NAME'."
}

# Create VPC
create_vpc

# Create Subnets
create_subnet 10.0.0.0/24 $SUBNET1_NAME
create_subnet 10.0.1.0/24 $SUBNET2_NAME

# Create Security Groups
create_security_group $SECURITY_GROUP1_NAME
create_security_group $SECURITY_GROUP2_NAME

# Create EC2 instances
create_ec2_instance $SECURITY_GROUP1_ID $SUBNET1_ID
create_ec2_instance $SECURITY_GROUP2_ID $SUBNET2_ID
