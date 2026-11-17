# Lab 01 - Repeat with Azure CLI
# Creates a user and adds it to the lab group

$domain = "<your-tenant>.onmicrosoft.com"

# Create a new user
az ad user create --display-name az104-user2 --user-principal-name "az104-user2@$domain" --password "<secure-password>"

# Get the user's object ID and add it to the group
$id = az ad user show --id "az104-user2@$domain" --query id -o tsv
az ad group member add --group "IT Lab Administrators" --member-id $id

# Verify group members
az ad group member list --group "IT Lab Administrators" --query "[].displayName" -o table