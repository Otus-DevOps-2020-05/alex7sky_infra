#output "external_ip_address_app" {
#  value = yandex_compute_instance.app.network_interface.0.nat_ip_address
#}
#output "instances_addresses" {
#  value = "Instances: ${element(yandex_compute_instance.app[*].network_interface.0.nat_ip_address, 0)}"
#}

output "external_ip_address_app0" {
  value = yandex_compute_instance.app.0.network_interface.0.nat_ip_address
}

output "external_ip_address_app1" {
  value = yandex_compute_instance.app.1.network_interface.0.nat_ip_address
}

output "balancer_ip_address_app" {
  value = yandex_lb_network_load_balancer.app-balancer.listener.*.external_address_spec.0.address
}