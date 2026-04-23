# Crear una red única para cada workspace
resource "docker_network" "private_network" {
  name = "network-${terraform.workspace}"
}

resource "docker_container" "db" {
  name  = "bd-${terraform.workspace}"
  image = "postgres:alpine"
  networks_advanced { name = docker_network.private_network.name }
  env   = ["POSTGRES_PASSWORD=password123"]
  ports {
    internal = 5432
    external = var.db_port[terraform.workspace]
  }
}

resource "docker_container" "api" {
  name  = "api-${terraform.workspace}"
  image = "lab/api"
  networks_advanced { name = docker_network.private_network.name }
  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }
}

resource "docker_container" "web" {
  name  = "web-${terraform.workspace}"
  image = "nginx:alpine"
  networks_advanced { name = docker_network.private_network.name }
  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }
}