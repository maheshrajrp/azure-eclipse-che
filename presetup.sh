helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install cert-manager jetstack/cert-manager \
  --wait \
  --create-namespace \
  --namespace cert-manager \
  --set crds.enabled=true

KUBECONFIG=./config
kubectl config current-context
helm upgrade ingress-nginx ingress-nginx/ingress-nginx \
  --wait \
  --create-namespace \
  --install \
  --namespace ingress-nginx \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz

kubectl get svc -n ingress-nginx
k config set-context --current --namespace=eclipse-che