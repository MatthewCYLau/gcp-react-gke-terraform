# React App on Google Kubernetes Engine (GKE) with Terraform

A reference project to deploy a React app onto Google Kubernetes Engine (GKE) with Terraform

## Pre-requisites

- Make sure you have installed [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli), and [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- Also install the `kubectl` CLI tool

```bash
gcloud components install kubectl # installs the kubectl CLI tool
terraform -help # prints Terraform options
```

## Configuration

- Populate `terraform.tfvars`:

```bash
region  = "europe-west2"
zone    = "europe-west2-b"
project = <GCP-PROJECT-ID>
creds   = <PATH-TO-GCP-CREDENTIALS-JSON>
```

## Build/Push the Docker image

```bash
docker build -t gcr.io/<your_project_id>/react-gke-app:v1 . # builds Docker image
gcloud auth configure-docker # configure Docker CLI tool to authenticate with Container Registry
docker push gcr.io/<your_project_id>/react-gke-app:v1 # pushes image to Container Registry!
```

## Create GCP resources

```bash
cd deploy # change to deploy directory
terraform init # initialises Terraform
terraform apply # deploys GCP stack
terraform destroy # destroys GCP stack
```

## Deployment

```bash
gcloud container clusters get-credentials react-gke-cluster --region=europe-west2 # updates a kubeconfig file with appropriate credentials
cd k8s
kubectl apply -f namespace.yml # create namespace
kubectl apply -f . # create deployment, ingress, and service
kubectl delete -f . # remove resources
```

- Visit app at `app_ip` e.g. `http://34.117.202.234/`

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
