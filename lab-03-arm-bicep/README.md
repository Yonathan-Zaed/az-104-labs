# Lab 03 – Manage Azure Resources by Using ARM Templates

Part of my [AZ-104: Microsoft Azure Administrator](https://learn.microsoft.com/en-us/credentials/certifications/azure-administrator/) study portfolio.
Based on the official [Microsoft Learning lab](https://microsoftlearning.github.io/AZ-104-MicrosoftAzureAdministrator/Instructions/Labs/LAB_03b-Manage_Azure_Resources_by_Using_ARM_Templates.html).

## Objective

Deploy the same resource (an Azure managed disk) in five different ways, using Infrastructure as Code to make deployments repeatable and consistent.

## Environment

| Item | Value |
|---|---|
| Subscription | Personal, Pay-As-You-Go |
| Resource group | `az104-rg3` |
| Region | East US |
| Tools | Azure portal, Cloud Shell (PowerShell and Bash), Azure PowerShell, Azure CLI, Bicep |

## What I did

| Task | Method | Resource created | Key step |
|---|---|---|---|
| 1 | Azure portal | `az104-disk1` | Created a Standard HDD 32 GiB managed disk and exported its ARM template and parameters file |
| 2 | Custom deployment (portal) | `az104-disk2` | Edited the exported template to use a generic `disk_name` parameter and redeployed it |
| 3 | Cloud Shell – Azure PowerShell | `az104-disk3` | Uploaded the files to Cloud Shell and deployed with `New-AzResourceGroupDeployment` |
| 4 | Cloud Shell – Azure CLI (Bash) | `az104-disk4` | Deployed the same template with `az deployment group create` |
| 5 | Cloud Shell – Bicep | `az104-disk5` | Edited a Bicep file (Standard SSD, 32 GiB) and deployed it with the CLI |

## Key commands

**Azure PowerShell**

```powershell
Get-AzContext
New-AzResourceGroupDeployment -ResourceGroupName az104-rg3 -TemplateFile template.json -TemplateParameterFile parameters.json
Get-AzDisk | ft Name,ResourceGroupName,Location,DiskSizeGb,ProvisioningState
```

**Azure CLI**

```bash
az account show
az deployment group create --resource-group az104-rg3 --template-file template.json --parameters parameters.json
az disk list --resource-group az104-rg3 --output table
```

**Bicep**

```bash
az deployment group create --resource-group az104-rg3 --template-file azuredeploydisk.bicep
```

## Files

| File | Description |
|---|---|
| `template.json` | ARM template exported from `az104-disk1` and edited to use the `disk_name` parameter |
| `parameters.json` | Parameters file matching the edited template |
| `azuredeploydisk.bicep` | Bicep file used to deploy `az104-disk5` |

## Key takeaways

- **Export as a starting point:** any existing resource or resource group can be exported as an ARM template, which is a fast way to turn a manual deployment into code.
- **Templates and parameters stay in sync:** renaming a parameter means updating both the template and the parameters file.
- **Same template, any tool:** the portal, Azure PowerShell and the Azure CLI all deploy the same ARM template; only the command changes.
- **Every deployment is recorded:** the resource group's *Deployments* blade keeps the template and the input values of each deployment.
- **Check the subscription context:** in an ephemeral Cloud Shell session, the active subscription can differ from the portal, so it is worth confirming it with `Get-AzContext` or `az account show` before deploying.
- **Bicep vs. JSON:** Bicep is built on ARM and describes the same resource with a much shorter, more readable syntax.

## Cleanup

All resources were removed by deleting the resource group:

```bash
az group delete --name az104-rg3 --yes --no-wait
```