# Azure Resource Group Creation

This Terraform project shows you how to deploy a resource group in Azure, resource groups house all types of resources so this is pretty fundamental.

## Prereqs

Before getting started, make sure you have the following prerequisites:

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine
- Azure account credentials

## Getting Started

1. Clone this repo to your local machine.

2. Navigate to the `Cloud-Stuff/Terraform/Azure_Resource_Group_Creation` directory.

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

8. Once the provisioning is complete, you can verify the creation of the Azure Resource Group in the Azure portal.

## Clean Up

To remove the provisioned Azure Resource Group and its associated resources, run the following command:

    ```bash
    terraform destroy
    ```

That will destory the resource group created.