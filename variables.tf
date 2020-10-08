variable "gcp_project_id" {
  type = string
  description = "The ID of the project in which the resources belong."
}

variable "cluster_name" {
  type = string
  description = "The name of the cluster, unique within the project and zone."
}

variable "gcp_location" {
  type = string
  description = "The location (region or zone) in which the cluster master will be created"
}

variable "daily_maintenance_window_start_time" {
  type = string
  description = "The start time of the 4 hour window for daily maintenance operations RFC3339(format HH:MM, where HH : [00-23] and MM : [00-59] GMT)"
}

variable "node_pools" {
  type = list(map(string))
  description = "The list of node pool configurations"
}

variable "vpc_network_name" {
  type = string
  description = "The name of the Google Compute Engine network to which the cluster is connected."
}

variable "vpc_subnetwork_name" {
  type = string
  description = "The name of the Google Compute Engine subnetwork in which the cluster's instances are launched."
}

variable "cluster_secondary_range_name" {
  type = string
  description = "The name of the secondary range to be used as for the cluster(POD IP) CIDR block."
}

variable "services_secondary_range_name" {
  type = string
  description = "The name of the secondary range to be used as for the services(ClusterIP) CIDR block."
}

variable "master_ipv4_cidr_block" {
  type    = string
  default = "172.16.0.0/28"
  description = "The IP range in CIDR notation to use for the hosted master network." 
}

variable "access_private_images" {
  type    = bool
  default = false
  description = "Whether to create the IAM role for storage.objectViewer, required to access GCR for private container images."
}

variable "http_load_balancing_disabled" {
  type    = bool
  default = false
  description = "The status of the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster." 
}

variable "master_authorized_networks_cidr_blocks" {
  type = list(map(string))
  default = [
    {
      # External network that can access Kubernetes master through HTTPS. Must
      # be specified in CIDR notation. This block should allow access from any
      # address, but is given explicitly to prevent Google's defaults from
      # fighting with Terraform.
      cidr_block = "0.0.0.0/0"
      # Field for users to identify CIDR blocks.
      display_name = "default"
    },
  ]

  description = "Defines up to 20 external networks that can access Kubernetes master through HTTPS."
}

variable "min_master_version" {
  type = string
  default = ""
  description = "The minimum version of the master." 
}

variable "release_channel" {
  type = string
  default = "REGULAR"
  description = "This allows you to subscribe your cluster to a channel that meets your business, stability, and functionality needs. This can be one of 'RAPID', 'REGULAR', or 'STABLE'."
}

variable "authenticator_security_group" {
  type = string
  default = ""

  description = "The name of the RBAC security group for use with Google security groups in Kubernetes RBAC. Group name must be in format gke-security-groups@yourdomain.com."
}

variable "stackdriver_logging" {
  type    = bool
  default = true
  description = "Whether Stackdriver Kubernetes logging is enabled."
}

variable "stackdriver_monitoring" {
  type    = bool
  default = true
  description = "Whether Stackdriver Kubernetes monitoring is enabled." 
}

variable "private_endpoint" {
  type    = bool
  default = false
  description = "Whether the master's internal IP address is used as the cluster endpoint and the public endpoint is disabled."
}

variable "private_nodes" {
  type    = bool
  default = true
  description = "Whether nodes have internal IP addresses only."
}

variable "pod_security_policy_enabled" {
  type = bool
  default = false
  description = "Whether Pod Security Policy is enabled."
}

variable "identity_namespace" {
  type = string
  default = "" 
  description = "The workload identity namespace to use with this cluster. Currently, the only supported identity namespace is the project's default '[project_id].svc.id.goog'."
}

variable "enable_cloud_nat" {
  type        = bool
  default     = true
  description = "Whether to enable Cloud NAT. This can be used to allow private cluster nodes to accesss the internet." 
}

variable "enable_cloud_nat_logging" {
  type        = bool
  default     = true
  description = "Whether the NAT should export logs. Defaults to 'true'."
}

variable "cloud_nat_logging_filter" {
  type        = string
  default     = "ERRORS_ONLY"
  description = "What filtering should be applied to logs for this NAT. Valid values are: 'ERRORS_ONLY', 'TRANSLATIONS_ONLY', 'ALL'. Defaults to 'ERRORS_ONLY'."
}

variable "vpc_subnetwork_cidr_range" {
  type        = string
  description = ""
}

variable "cluster_secondary_range_cidr" {
  type        = string
  description = ""
}

variable "services_secondary_range_cidr" {
  type        = string
  description = ""
}
