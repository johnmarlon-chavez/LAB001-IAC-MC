
# Laboratorio 01: Infraestructura como Código (IaC) con Terraform y Docker

## 1. Descripción del Proyecto
Este proyecto implementa una arquitectura de tres capas (Frontend, Backend y Base de Datos) utilizando **Terraform** para la orquestación de contenedores **Docker**. La solución está diseñada para ser escalable y multientorno, permitiendo el despliegue independiente en espacios de trabajo de Desarrollo (DEV) y Control de Calidad (QA).

## 2. Arquitectura de la Solución
La infraestructura consta de los siguientes componentes:
- **Web (Frontend):** Servidor basado en Nginx.
- **API (Backend):** Aplicación Node.js personalizada.
- **Database:** Motor de base de datos PostgreSQL.
- **Redes:** Redes bridge de Docker aisladas por cada entorno (`network-dev`, `network-qa`).

## 3. Tecnologías Utilizadas
- **Terraform:** Para la definición y gestión de la infraestructura.
- **Docker:** Para la contenerización de los servicios.
- **Conventional Commits:** Para un historial de Git estandarizado y profesional.

---

## 4. Guía de Despliegue

### Paso 1: Preparación de Imágenes
Antes de aplicar Terraform, es necesario construir la imagen local de la API:
```bash
cd src/api
docker build -t lab/api .