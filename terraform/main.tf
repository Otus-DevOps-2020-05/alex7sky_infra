provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone

}
resource "yandex_compute_instance" "app" {
  name  = "reddit-app-${count.index}"
  count = var.instance_count
  zone  = var.instance_zone
  resources {
    cores  = 2
    memory = 2

  }
  connection {
    type = "ssh"
    #host        = element(yandex_compute_instance.app.network_interface.0.nat_ip_address, 0)
    host = self.network_interface.0.nat_ip_address
    #host        = instances_addresses
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key)
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"


  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}


