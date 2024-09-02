Site Reliability Engineering Case

1. Provision a Kubernetes cluster.
2. Install a basic Prometheus instance.
   ● No need for detailed configuration.
   ● Should collect cluster, deployment and pod metrics.

3. Develop an application that checks overall k8s pod and node health.
   ● Should be able to restart another pod if that pod gets a specific error on logs/events.
   ● Should create an event to queue if a node is getting to limits.
   ● Please deploy another application that can be tested with the
   given situations.
   ● Application needs to constantly check Prometheus for error
   metrics to restart/remove/delete pod

4. Application needs to use Go Kubernetes client package (you are
   expected to use either OperatorSDK or controller-runtime etc. according
   to your application requirements/design choice)

5. You are expected to create an ELK stack (including fluentbit) to monitor
   and collect all application JSON logs from Kubernetes pods

6. Create Kubernetes deployment manifests for your application
   Notes:
   ● You can use AWS or GCP as a provider or you can use kind/minikube.
   ● Include a README document and design diagram for us to understand
   your approach.
   ● Create meaningful commit messages.
   ● Follow security best practices as best you can.
   ● Follow Go best practices, package structure.
   ● Use appropriate design patterns anywhere needed.
   ● The application will run multiple instances, so, consider concurrency
   requirements.
