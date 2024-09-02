# Kubernetes ve GCP Kurulum Kılavuzu

Bu belge, Google Cloud Platform (GCP) üzerinde Kubernetes cluster'ı kurmak ve gerekli bileşenleri deploy etmek için gereken adımları açıklar.

## Başlangıç

### Google Hesabı ve Bucket Oluşturma

1. **Google Hesabı Oluşturma:**
   - Google Cloud Console'da yeni bir hesap oluşturun.
   - [Google Hesap Oluşturma](https://accounts.google.com/signup) bağlantısını takip edebilirsiniz.

2. **Bucket Oluşturma:**
   - Google Cloud Console'da Cloud Storage bölümüne gidin.
   - Yeni bir bucket oluşturun.

### GCP CLI ve Terraform Kurulumu

1. **GCP CLI'yi Yükleyin:**
   - `gcloud auth login`: GCP CLI ile Google hesabınıza giriş yapın.
   - `gcloud config set project PROJECT_ID`: Çalışmak istediğiniz proje ID'sini ayarlayın.

2. **Terraform ile Proje Başlatma:**
   - `terraform init`: Terraform projesini başlatır.
   - `terraform plan`: Planlama yaparak ne tür değişikliklerin yapılacağını gösterir.
   - `terraform apply`: Belirtilen değişiklikleri uygular.

### Kubernetes ve Helm Kurulumu

1. **Kubectl ve GKE Eklentileri:**
   - `gcloud components install kubectl`: Kubectl'yi yükler.
   - `kubectl version --client`: Kubectl sürümünü kontrol eder.
   - `gcloud components install gke-gcloud-auth-plugin`: GKE için kimlik doğrulama eklentisini yükler.
   - `gke-gcloud-auth-plugin --version`: Eklenti sürümünü kontrol eder.

2. **Kubernetes Cluster ile Bağlantı:**
   - `gcloud container clusters get-credentials primary --region=us-central1-a`: 'primary' isimli Kubernetes cluster'ına bağlanır.

### Prometheus Kurulumu

1. **Prometheus İçin Namespace Oluşturma:**
   - `kubectl create namespace prometheus`: 'prometheus' isimli bir namespace oluşturur.

2. **Prometheus Bileşenlerini Deploy Etme:**
   - `kubectl apply -f prometheus-config.yaml -n prometheus`: Prometheus konfigürasyonunu deploy eder.
   - `kubectl apply -f prometheus-deployment.yaml -n prometheus`: Prometheus deployment'ını başlatır.
   - `kubectl apply -f prometheus-service.yaml -n prometheus`: Prometheus servislerini oluşturur.
   - `kubectl get service prometheus-service -n prometheus`: Prometheus servisinin durumunu kontrol eder.

### Helm ile Diğer Bileşenlerin Kurulumu

1. **Kube-State-Metrics Kurulumu:**
   - `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`: Prometheus community Helm repository'sini ekler.
   - `helm repo update`: Repository'leri günceller.
   - `helm install kube-state-metrics prometheus-community/kube-state-metrics -n kube-system`: `kube-state-metrics`'i kube-system namespace'inde kurar.

2. **Elasticsearch Kurulumu:**
   - `helm repo add elastic https://helm.elastic.co`: Elastic Helm repository'sini ekler.
   - `helm install elasticsearch -f elasticsearch.yaml elastic/elasticsearch -n elastic`: Elasticsearch'i Elastic Helm chart'ı ile deploy eder.

3. **Loki Kurulumu:**
   - `helm upgrade --install loki --namespace=prometheus grafana/loki-stack`: Loki stack'ini 'prometheus' namespace'inde kurar.

## Notlar

- GCP, Kubernetes, ve Helm komutlarının doğru çalışabilmesi için önceden gerekli araçların ve eklentilerin kurulu olması gerekir.
- Dosyaların (`prometheus-config.yaml`, `prometheus-deployment.yaml`, `prometheus-service.yaml`, `elasticsearch.yaml`) doğru ve geçerli olduğundan emin olun.

## Sorular ve Destek

Herhangi bir sorun yaşarsanız, lütfen destek ekibiyle iletişime geçin veya ilgili dökümantasyonları kontrol edin.
