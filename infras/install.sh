#!/bin/bash
set -e

terraform apply --auto-approve
terraform output -raw kube_config > ../config

cp ../config $KUBECONFIG 