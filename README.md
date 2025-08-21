# About Repository
Trying to set-up Eclipse Che with Azure Entra


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