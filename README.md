## Quickstart 

1. **[Create a Google Cloud Project](https://cloud.google.com/resource-manager/docs/creating-managing-projects)** and connect it to an existing Billing account.
2. **Open a bash-compatible shell** (eg. [Google Cloud Shell](https://cloud.google.com/shell)) and ensure you have the following tools installed: 

* [Google Cloud SDK version >= 325.0.0](https://cloud.google.com/sdk/docs/downloads-versioned-archives)
* * [Terraform >= 0.13](https://www.terraform.io/downloads.html)
* [kubectl](https://kubernetes.io/docs/tasks/tools/) ( >= v1.20)

3. **Set your Project ID environment variable and operating system.** 

```bash
export PROJECT_ID=<your-project-id>
```

4. **Set up local authentication to your project.**

```
gcloud config set project $PROJECT_ID
gcloud auth login
gcloud auth application-default login
```

## Provision the GKE cluster

**NOTE:** [Compute Engine API](https://console.developers.google.com/apis/api/compute.googleapis.com/overview) and [Kubernetes Engine API](https://console.cloud.google.com/apis/api/container.googleapis.com/overview) are required for ```terraform apply``` to work on this configuration. Enable both APIs for your Google Cloud project before continuing.
