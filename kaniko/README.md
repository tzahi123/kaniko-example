## Quickstart 

1. **[Create a Google Cloud Project](https://cloud.google.com/resource-manager/docs/creating-managing-projects)** and connect it to an existing Billing account.
2. **Open a bash-compatible shell** (eg. [Google Cloud Shell](https://cloud.google.com/shell)) and ensure you have the following tools installed: 

* [Google Cloud SDK version >= 423.0.0](https://cloud.google.com/sdk/docs/downloads-versioned-archives)
* * [Terraform >= v1.2.7](https://www.terraform.io/downloads.html)
* [kubectl](https://kubernetes.io/docs/tasks/tools/) ( >= v1.24)

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

## Usage
Simple usage is as follows:

```hcl
# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                = "../../../google_kubernetes_engine"
  project_id            = var.project_id
  region                = var.region
  network               = google_compute_network.main.name
  network_id            = google_compute_network.main.id
  cluster_name          = var.cluster_name
  subnet_cidr           = var.subnet_cidr
  services_range_name   = var.services_range_name 
  services_cidr         = var.services_cidr
  cluster_range_name    = var.cluster_range_name
  cluster_cidr          = var.cluster_cidr
  k8s_service_account   = var.k8s_service_account
  locations             = var.locations
  initial_node_count    = var.initial_node_count 
  labels                = var.labels
  master_cidr           = var.master_cidr
  ingress_ports         = var.ingress_ports
  node_pools            = var.node_pools
  router_nat_name       = var.router_nat_name
  router_name           = var.router_name
  url_prefix            = var.url_prefix
}

```
<!-- do not understand what this is about -->
Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Resources

| Name | Type |
|------|------|
| [Container-native load balancing](https://cloud.google.com/kubernetes-engine/docs/concepts/container-native-load-balancing) | resource |
| [Set up HTTP(S) Load Balancing with Ingress](https://cloud.google.com/kubernetes-engine/docs/tutorials/http-balancer) | resource |
| [Terraform => Google Cloud Platform Provider](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs) | resource |
| [google_dns_managed_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/data-sources/dns_managed_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_cidr"></a> [cluster\_cidr](#input\_cluster\_cidr) | The IP range in CIDR notation for the cluster range. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster. | `string` | n/a | yes |
| <a name="input_cluster_range_name"></a> [cluster\_range\_name](#input\_cluster\_range\_name) | The name of the cluster range in the subnet. | `string` | n/a | yes |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | The initial number of nodes to create in each node pool. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | The resource labels (a map of key/value pairs) to be applied to kubernetes nodes. | `map(string)` | `{}` | no |
| <a name="input_lb_ip"></a> [lb\_ip](#input\_lb\_ip) | The Static IP address of the load balancer. | `string` | n/a | yes |
| <a name="input_locations"></a> [locations](#input\_locations) | A list of the zones to use for the cluster. | `list(any)` | n/a | yes |
| <a name="input_master_cidr"></a> [master\_cidr](#input\_master\_cidr) | The IP range in CIDR notation for the master node. | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The name of the VPC network to create the cluster in. | `string` | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | A list of maps that define the node pools to create. | `list(any)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where the cluster will be created. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to create the cluster in. | `string` | n/a | yes |
| <a name="input_services_cidr"></a> [services\_cidr](#input\_services\_cidr) | The IP range in CIDR notation for the services range. | `string` | n/a | yes |
| <a name="input_services_range_name"></a> [services\_range\_name](#input\_services\_range\_name) | The name of the services range. | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_url_prefix"></a> [url\_prefix](#input\_url\_prefix) | The prefix to use for the Cluster Ingress URL. | `string` | n/a | yes |

## Outputs

| Name | Description | sensitive |
|------|-------------|-----------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a | yes |
|   |   |   |   |
