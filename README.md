# About Repository
Trying to set-up Eclipse Che with Azure Entra

## Sets to setup
1. Go into infras folder and run `install.sh`
1. The output will give you a config file. Place it in the KubeConfig Home.
1. Make sure to populate the Azure Entra values by creating a `.env` file based on `template.env`.
1. Now start with `presetup.sh` to install Cert managers, etc followed by `install.sh` 

## Deploying Cert Manager
helm install cert-manager jetstack/cert-manager \
  --wait \
  --create-namespace \
  --namespace cert-manager \
  --set crds.enabled=true

## Commonly used Commands
1. k logs deploy/che-gateway -c oauth-proxy --tail 0 -f
1. k logs deploy/che-gateway -c oauth-proxy -f
1. k get CheCluster eclipse-che -o yaml > che-cluster.yaml
1. https://login.microsoftonline.com/$TENANT_ID/v2.0/.well-known/openid-configuration