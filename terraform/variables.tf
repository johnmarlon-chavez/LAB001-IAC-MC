variable "dev_ports" {
  type = map(number)
  description = "Puertos externos para el entorno de DEV"
}

variable "qa_ports" {
  type = map(number)
  description = "Puertos externos para el entorno de QA"
}

variable "postgres_password" {
  type      = string
  sensitive = true
}