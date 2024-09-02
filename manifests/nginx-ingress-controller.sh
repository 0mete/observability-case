kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account)

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.11.2/deploy/static/provider/cloud/deploy.yaml

kubectl get pods --namespace=ingress-nginx

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s

kubectl create deployment demo --image=httpd --port=80
kubectl expose deployment demo

kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80

For Testing

kubectl create ingress demo --class=nginx \
  --rule="www.demo.io/*=demo:80"