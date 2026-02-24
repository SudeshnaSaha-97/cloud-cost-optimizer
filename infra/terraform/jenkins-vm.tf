resource "google_compute_instance" "jenkins_vm" {
  count        = var.enable_jenkins_vm ? 1 : 0
  name         = "jenkins-server"
  machine_type = "e2-medium"
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y openjdk-11-jdk jenkins
    systemctl enable jenkins
    systemctl start jenkins
  EOT
}



