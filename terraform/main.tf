# Redes
resource "docker_network" "dev_net" { name = "dev_network" }
resource "docker_network" "qa_net"  { name = "qa_network" }

# --- ENTORNO DEV ---
resource "docker_container" "db_dev" {
  name  = "bd-dev"
  image = "postgres:alpine"
  networks_advanced { name = docker_network.dev_net.name }
  env   = ["POSTGRES_PASSWORD=${var.postgres_password}"]
  ports { internal = 5432; external = var.dev_ports["db"] }
}

resource "docker_container" "api_dev" {
  name  = "api-dev"
  image = "lab/api"
  networks_advanced { name = docker_network.dev_net.name }
  ports { internal = 3000; external = var.dev_ports["api"] }
}

resource "docker_container" "web_dev" {
  name  = "web-dev"
  image = "nginx:alpine"
  networks_advanced { name = docker_network.dev_net.name }
  ports { internal = 80; external = var.dev_ports["web"] }
}

# --- ENTORNO QA ---
resource "docker_container" "db_qa" {
  name  = "bd-qa"
  image = "postgres:alpine"
  networks_advanced { name = docker_network.qa_net.name }
  env   = ["POSTGRES_PASSWORD=${var.postgres_password}"]
  ports { internal = 5432; external = var.qa_ports["db"] }
}

resource "docker_container" "api_qa" {
  name  = "api-qa"
  image = "lab/api"
  networks_advanced { name = docker_network.qa_net.name }
  ports { internal = 3000; external = var.qa_ports["api"] }
}

resource "docker_container" "web_qa" {
  name  = "web-qa"
  image = "nginx:alpine"
  networks_advanced { name = docker_network.qa_net.name }
  ports { internal = 80; external = var.qa_ports["web"] }
}