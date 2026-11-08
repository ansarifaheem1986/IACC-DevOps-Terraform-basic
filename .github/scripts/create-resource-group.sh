#!/usr/bin/env bash
set -Eeuo pipefail
trap 'printf "ERROR: Resource-group script failed at line %s.\n" "$LINENO" >&2' ERR
 
: "${AZURE_SUBSCRIPTION_ID:?Set AZURE_SUBSCRIPTION_ID before running this script}"
if ! command -v az >/dev/null 2>&1; then
  printf 'ERROR: Azure CLI (az) is not installed.\n' >&2
  exit 1
fi
 
actual_subscription="$(az account show --query id --output tsv)"
if [[ "$actual_subscription" != "$AZURE_SUBSCRIPTION_ID" ]]; then
  printf 'ERROR: Azure subscription mismatch; no resources were changed.\n' >&2
  exit 1
fi
 
resource_group='devops-iacc-gitaction-cd-rg-01'
location='eastus'
printf 'Creating or updating training resource group: %s\n' "$resource_group"
az group create \
  --subscription "$AZURE_SUBSCRIPTION_ID" \
  --name "$resource_group" \
  --location "$location" \
  --tags purpose=devops-bootcamp managed-by=github-actions \
  --only-show-errors --output none
 
az group show \
  --subscription "$AZURE_SUBSCRIPTION_ID" \
  --name "$resource_group" \
  --query '{name:name,location:location,state:properties.provisioningState}' \
  --output table