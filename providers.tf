provider "google" {
  version     = "~> 2.14"
  credentials = "${file("daily-report-59af560d7db7.json")}"
  project     = "daily-report-251707"
  region      = "asia-northeast1"
}
