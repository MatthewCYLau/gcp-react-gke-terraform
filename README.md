# React App on Google Kubernetes Engine (GKE) with Terraform

A reference project to deploy a React app onto Google Kubernetes Engine (GKE) with Terraform

## Pre-requisites

- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) already installed locally
- Install the `kubectl` CLI tool:

```bash
gcloud components install kubectl # installs the kubectl CLI tool
```

## Deployment

```bash
gcloud container clusters get-credentials react-gke-cluster --region=europe-west2
cd k8s
kubectl apply -f namespace.yml # create namespace
kubectl apply -f . # create deployment, ingress, and service
kubectl delete -f . # remove resources
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
