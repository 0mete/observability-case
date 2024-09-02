create google account
create bucket

gcloud auth login
gcloud config set project PROJECT_ID

terraform init
terraform plan
terraform apply


gcloud components install kubectl
kubectl version --client
gcloud components install gke-gcloud-auth-plugin
gke-gcloud-auth-plugin --version

gcloud container clusters get-credentials primary --region=us-central1-a


kubectl create namespace prometheus

kubectl apply -f prometheus-config.yaml -n prometheus

kubectl apply -f prometheus-deployment.yaml -n prometheus
kubectl apply -f prometheus-service.yaml -n prometheus
kubectl get service prometheus-service -n prometheus


helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 
helm repo update
helm install kube-state-metrics prometheus-community/kube-state-metrics -n kube-system

helm repo add elastic https://helm.elastic.co
helm install elasticsearch -f elasticsearch.yaml elastic/elasticsearch -n elastic

helm upgrade --install loki --namespace=prometheus grafana/loki-stack


kubectl run 