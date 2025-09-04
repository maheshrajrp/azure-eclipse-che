helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install cert-manager jetstack/cert-manager \
  --wait \
  --create-namespace \
  --namespace cert-manager \
  --set crds.enabled=true

kubectl config current-context
helm upgrade ingress-nginx ingress-nginx/ingress-nginx \
  --wait \
  --create-namespace \
  --install \
  --namespace ingress-nginx \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz

echo Set the External IP to DNS A Record of the Provider of your choice. 
kubectl get svc -n ingress-nginx

kubectl config set-context --current --namespace=eclipse-che
kubectl apply -f ./redis.yaml