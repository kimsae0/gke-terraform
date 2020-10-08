gcp_project_id = "ttc-team-07"

cluster_name = "ttc-team07-cluster2"

gcp_location = "asia-northeast3"

daily_maintenance_window_start_time = "03:00"

node_pools = [
  {
    name                       = "ttc-team07-np"
    initial_node_count         = 1
    autoscaling_min_node_count = 2
    autoscaling_max_node_count = 3
    management_auto_upgrade    = true
    management_auto_repair     = true
    node_config_machine_type   = "e2-standard-2"
    node_config_disk_type      = "pd-standard"
    node_config_disk_size_gb   = 30
    node_config_preemptible    = false
  },
]

vpc_network_name = "team07-vpc-network2"

vpc_subnetwork_name = "team07-vpc-subnetwork2"

vpc_subnetwork_cidr_range = "10.0.30.0/20"

cluster_secondary_range_name = "pods"

cluster_secondary_range_cidr = "10.30.0.0/12"

services_secondary_range_name = "services"

services_secondary_range_cidr = "10.1.0.0/20"

master_ipv4_cidr_block = "172.30.0.0/28"

access_private_images = "true"

http_load_balancing_disabled = "false"

master_authorized_networks_cidr_blocks = [
  {
    cidr_block = "211.45.60.4/31"
    display_name = "Requirement #1"
  },
  {
    cidr_block = "3.34.33.23/32"
    display_name = "Requirement #2"
  },
  {
    cidr_block = "175.117.250.87/32"
    display_name = "Team Member #1"
  },
  {
    cidr_block = "1.238.81.100/32"
    display_name = "Team Member #2"
  },
  {
    cidr_block = "14.33.198.117/32"
    display_name = "Team Member #3"
  },
]

identity_namespace = "ttc-team-07.svc.id.goog"

private_nodes = true

private_endpoint = false 

stackdriver_logging = false

stackdriver_monitoring = false