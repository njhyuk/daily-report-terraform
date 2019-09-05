terraform {
  required_version = ">= 0.11.5"

  backend "gcs" {
    bucket = "njh-daily-report-state"
    prefix = "daily-report"
  }
}
