#!/bin/sh

#Pre-setup, Reading Shells, and etc 
if [ ! -f .env ]; then
	echo "Env file not found. This is needed to proceed with the installation of Eclipse Che"
	exit 1
fi

export $(grep -v '^#' .env | xargs)

chectl server:delete

source .env
envsubst < che-cluster-template.yaml > che-cluster.yaml

chectl server:deploy --platform=k8s --che-operator-cr-patch-yaml=che-cluster.yaml --skip-cert-manager --domain=$DEPLOYMENT_DOMAIN
