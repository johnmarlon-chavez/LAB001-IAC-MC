output "entorno" {
  value = terraform.workspace
}

output "url_web" {
  value = "http://localhost:${var.web_port[terraform.workspace]}"
}