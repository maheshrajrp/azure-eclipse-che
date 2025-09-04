#!/bin/bash
set -e

terraform apply --auto-approve
terraform output -raw kube_config > ../config
terraform output -json > output.json

# Only backup KUBECONFIG if it exists and is not empty
if [ -n "$KUBECONFIG" ] && [ -f "$KUBECONFIG" ]; then
  echo "Backing up existing KUBECONFIG"
  timestamp=$(date +%Y%m%d_%H%M%S)
  cp "$KUBECONFIG" "${KUBECONFIG}_backup_$timestamp"
fi

cp ../config $KUBECONFIG