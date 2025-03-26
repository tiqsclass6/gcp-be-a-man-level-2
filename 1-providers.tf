provider "google" {
  credentials = file("${path.module}/<INSERT-JSON-FILEPATH-HERE>")
  project     = var.project_id
  region      = "CHANGE-YOUR-REGION-HERE" # Change your default region; resources will specify their own region
}