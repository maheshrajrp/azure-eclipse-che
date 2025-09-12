# About Repository
This repository contains Terraform scripts and configuration files for setting up Eclipse Che with Azure Entra ID (formerly Azure AD) authentication integration. 

## Purpose
This is an experimental project focused on:
1. Configuring Eclipse Che workspace with Azure Entra ID authentication
1. Infrastructure provisioning using Terraform for Azure resources
1. Finding optimal configuration settings for enterprise development environments
1. Testing authentication flows and user management integration

## Sets to setup
1. Go into infras folder and run `install.sh`
1. Make sure to populate the Azure Entra values by creating a `.env` file based on `template.env` or if not run `app_registration.sh` to register application for you.
1. Now start with `presetup.sh` to install Cert managers, etc followed by `install.sh` 


## Commonly used Commands
1. k logs deploy/che-gateway -c oauth-proxy --tail 0 -f
1. k logs deploy/che-gateway -c oauth-proxy -f
1. k get CheCluster eclipse-che -o yaml > che-cluster.yaml
1. https://login.microsoftonline.com/$TENANT_ID/v2.0/.well-known/openid-configuration
