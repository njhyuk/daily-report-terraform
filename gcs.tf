resource "google_storage_bucket" "terraform_state" {
  name     = "njh-daily-report-state"
  location = "asia-northeast1"
  versioning {
    enabled = true
  }
}
