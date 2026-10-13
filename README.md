# ☁️ AZ-104 Labs — Microsoft Azure Administrator

Hands-on labs completed while preparing for the **Microsoft Certified: Azure Administrator Associate (AZ-104)** exam.

Each lab documents what I built, the commands I used (Portal, Azure CLI, and PowerShell), the issues I ran into, and how I fixed them. The goal is to show real hands-on practice, not just theory.

![Azure](https://img.shields.io/badge/Microsoft_Azure-0078D4?style=flat&logo=microsoftazure&logoColor=white)
![Azure CLI](https://img.shields.io/badge/Azure_CLI-0078D4?style=flat&logo=microsoftazure&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=flat&logo=powershell&logoColor=white)
![Status](https://img.shields.io/badge/status-in_progress-yellow?style=flat)

---

## 🗺️ Lab Index

**Status:** ✅ Done · 🔄 In progress · ⬜ Not started

### 🔐 Identity & Governance
| # | Lab | Key services | Status |
|---|---|---|---|
| 01 | Manage Microsoft Entra ID identities | Entra ID, users, groups | ⬜ |
| 02a | Manage subscriptions and RBAC | Management groups, RBAC, custom roles | ⬜ |
| 02b | Manage governance with Azure Policy | Azure Policy, tags, resource locks | ⬜ |
| 03 | [Manage resources with ARM templates](labs/03-arm-bicep/) | ARM, Bicep, Cloud Shell | ✅ |

### 🌐 Virtual Networking
| # | Lab | Key services | Status |
|---|---|---|---|
| 04 | Implement virtual networking | VNets, subnets, NSGs, ASGs, DNS | ⬜ |
| 05 | Implement intersite connectivity | VNet peering, route tables | ⬜ |
| 06 | Implement traffic management | Load Balancer, Application Gateway | ⬜ |

### 💾 Storage
| # | Lab | Key services | Status |
|---|---|---|---|
| 07 | Manage Azure Storage | Storage accounts, Blob, Files, SAS | ⬜ |

### 🖥️ Compute
| # | Lab | Key services | Status |
|---|---|---|---|
| 08 | Manage virtual machines | VMs, availability, VM Scale Sets | ⬜ |
| 09a | Implement Web Apps | App Service, deployment slots | ⬜ |
| 09b | Implement Azure Container Instances | ACI | ⬜ |
| 09c | Implement Azure Container Apps | Container Apps | ⬜ |

### 📊 Monitoring & Data Protection
| # | Lab | Key services | Status |
|---|---|---|---|
| 10 | Implement data protection | Azure Backup, Site Recovery | ⬜ |
| 11 | Implement monitoring | Azure Monitor, Log Analytics, alerts | ⬜ |

---

## 📁 Repository Structure

```
az-104-labs/
├── README.md              ← you are here
├── _template/
│   └── README.md          ← template used for every lab
└── labs/
    ├── 01-entra-id-identities/
    │   ├── README.md      ← lab write-up
    │   ├── scripts/       ← Azure CLI / PowerShell commands
    │   └── images/        ← screenshots
    └── ...
```

---

## 💰 Cost Control

All labs run on a Pay-As-You-Go subscription. To keep costs low:
- A **budget alert** is set on the subscription
- Every lab uses its own **resource group**, deleted at the end with `az group delete`
- Subscription IDs, tenant IDs, and secrets are **redacted** from scripts and screenshots

---

## 📚 Resources

- [Microsoft Learn — AZ-104 learning path](https://learn.microsoft.com/en-us/credentials/certifications/azure-administrator/)
- [Official AZ-104 lab instructions](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator)
- [John Savill — Azure Master Class](https://www.youtube.com/@NTFAQGuy)

---

👤 **Yonathan Zaed** · [GitHub profile](https://github.com/Yonathan-Zaed)
