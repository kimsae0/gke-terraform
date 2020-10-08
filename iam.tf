resource "random_id" "random" {
  byte_length = 6
}

resource "google_service_account" "default" {
  provider = google

  account_id   = "cluster-minimal-${random_id.random.hex}"
  display_name = "Minimal service account for GKE cluster ${var.cluster_name}"
  project      = var.gcp_project_id
}

resource "google_project_iam_member" "logging-log-writer" {
  provider = google

  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.default.email}"
  project = var.gcp_project_id
}

resource "google_project_iam_member" "monitoring-metric-writer" {
  provider = google

  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.default.email}"
  project = var.gcp_project_id
}

resource "google_project_iam_member" "monitoring-viewer" {
  provider = google

  role    = "roles/monitoring.viewer"
  member  = "serviceAccount:${google_service_account.default.email}"
  project = var.gcp_project_id
}

resource "google_project_iam_member" "storage-object-viewer" {
  provider = google

  count   = var.access_private_images == "true" ? 1 : 0
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.default.email}"
  project = var.gcp_project_id
}
