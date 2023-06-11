# Azure VM Creation

This Terraform project demonstrates how to deploy a Resource Group, Virtual Network (VNet), and Virtual Machines (VMs) in Azure. It will create a Windows 10 Virtual Machine and set up the necessary networking components.

## Prerequisites

Before getting started, make sure you have the following prerequisites:

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine
- Azure account credentials

## Getting Started

1. Clone this repository to your local machine.

2. Navigate to the `Azure_VM_Creation` directory.

3. Open the `main.tf` file and review the configuration settings.

4. Initialize the Terraform working directory by running the following command:

    ```bash
    terraform init
    ```

5. Review the planned changes by running the following command:

    ```bash
    terraform plan
    ```

6. If the plan looks satisfactory, apply the changes by running the following command:

    ```bash
    terraform apply
    ```

7. Confirm the changes by typing `yes` when prompted.

8. Once the provisioning is complete, you can verify the creation of the Azure VM and its associated resources in the [Azure portal](portal.azure.com).

## Clean Up

To remove the provisioned Azure VM and its associated resources, run the following command:

    ```bash
    terraform destroy
    ```

This will destroy the VM, VNet, and Resource Group created.