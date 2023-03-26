## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.50.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.5.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.12.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.50.0 |
| <a name="provider_google.c-retail"></a> [google.c-retail](#provider\_google.c-retail) | 4.50.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_forwarding_rule.default](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_forwarding_rule) | resource |
| [google_compute_region_backend_service.default](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/resources/compute_region_backend_service) | resource |
| [google_compute_region_health_check.default](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/resources/compute_region_health_check) | resource |
| [google_compute_subnetwork.k8s](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/resources/compute_subnetwork) | resource |
| [google_container_cluster.k8s](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/resources/container_cluster) | resource |
| [google_container_node_pool.nodes](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/resources/container_node_pool) | resource |
| [google_dns_record_set.a](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/resources/dns_record_set) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/data-sources/client_config) | data source |
| [google_compute_instance_group.node_instance_groups1](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/data-sources/compute_instance_group) | data source |
| [google_compute_instance_group.node_instance_groups2](https://registry.terraform.io/providers/hashicorp/google/4.50.0/docs/data-sources/compute_instance_group) | data source |
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

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
