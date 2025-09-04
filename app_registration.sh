# Constants
export ECLIPSE_CHE_APPLICATION_DISPLAY_NAME=<APP-NAME>
export DEPLOYMENT_DOMAIN=<DOMAIN>
export AZURE_TENANT_ID=<TENANT-ID>

# Begin Azure Entra Setup
az ad app create \
  --display-name $ECLIPSE_CHE_APPLICATION_DISPLAY_NAME \
  --enable-access-token-issuance \
  --required-resource-accesses '[{"resourceAccess":[{"id":"34a47c2f-cd0d-47b4-a93c-2c41130c671c","type":"Scope"}],"resourceAppId":"6dae42f8-4368-4678-94ff-3960e28e3630"},{"resourceAccess":[{"id":"e1fe6dd8-ba31-4d61-89e7-88639da4683d","type":"Scope"}],"resourceAppId":"00000003-0000-0000-c000-000000000000"}]' \
  --optional-claims '{"accessToken":[{"additionalProperties":[],"essential":false,"name":"groups","source":null}]}'  \
  --sign-in-audience AzureADMyOrg \
  --web-redirect-uris https://dev.theiris.club/oauth/callback

az ad app update \
  --id $(az ad app list --query "[?displayName=='$ECLIPSE_CHE_APPLICATION_DISPLAY_NAME'].id" --output tsv) \
  --set groupMembershipClaims=SecurityGroup

export CLIENT_ID=$(az ad app list --query "[?displayName=='$ECLIPSE_CHE_APPLICATION_DISPLAY_NAME'].appId" --output tsv)

export CLIENT_SECRET=$(az ad app credential reset --id $(az ad app list --query "[?displayName=='$ECLIPSE_CHE_APPLICATION_DISPLAY_NAME'].id" --output tsv) --query "password" --output tsv)

# Output the variables to a file
cat << EOF > .env
ECLIPSE_CHE_APPLICATION_DISPLAY_NAME=$ECLIPSE_CHE_APPLICATION_DISPLAY_NAME
AZURE_CLIENT_ID=$CLIENT_ID
AZURE_CLIENT_SECRET=$CLIENT_SECRET
DEPLOYMENT_DOMAIN=$DEPLOYMENT_DOMAIN
AZURE_TENANT_ID=$AZURE_TENANT_ID
EOF

echo "Credentials saved to .env files"