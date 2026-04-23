output "dev_urls" {
  value = {
    frontend = "http://localhost:${var.dev_ports["web"]}"
    api      = "http://localhost:${var.dev_ports["api"]}"
  }
}

output "qa_urls" {
  value = {
    frontend = "http://localhost:${var.qa_ports["web"]}"
    api      = "http://localhost:${var.qa_ports["api"]}"
  }
}