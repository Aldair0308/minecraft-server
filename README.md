# Servidor de Minecraft en Docker (Última versión estable)

Este repositorio contiene todo lo necesario para desplegar un **servidor
de Minecraft Java Edition no premium**, utilizando **Docker** y listo
para subirlo a **Railway** o ejecutarlo localmente.

## 🚀 Objetivo del Proyecto

Crear un entorno completamente automatizado que: - Use la **última
versión estable** del servidor de Minecraft. - Soporte modo **no
premium** (online-mode: false). - Permita configurar el servidor
fácilmente con variables de entorno. - Sea desplegable en **Railway** o
cualquier servicio compatible con Docker. - Pueda subirse como imagen a
**Docker Hub**.

## 📦 ¿Qué incluye?

-   `Dockerfile` optimizado basado en la imagen oficial de Eclipse
    Temurin.
-   Script para descargar automáticamente la última versión del
    servidor.
-   Archivos de configuración inicial: `server.properties`, `eula.txt`,
    etc.
-   Preparación para crear una imagen lista para producción.
-   Documentación para ejecutar local y en Railway.

## 🛠 Tecnologías

-   Docker
-   Minecraft Server (Java)
-   GitHub
-   Railway (deployment)
-   Opcional: Docker Hub

## 📁 Estructura esperada del repositorio

    /
    ├── Dockerfile
    ├── docker-compose.yml (opcional para local)
    ├── server.properties
    ├── eula.txt
    ├── start.sh
    └── README.md

## ▶️ Comandos principales

### Ejecutar localmente

    docker build -t minecraft-server .
    docker run -p 25565:25565 minecraft-server

### Subir a Docker Hub

    docker tag minecraft-server tuusuario/minecraft-server:latest
    docker push tuusuario/minecraft-server:latest

## ⚠️ Importante

Antes de subir o ejecutar: - Asegúrate de aceptar la EULA en
`eula.txt`. - Railway requiere que abras el puerto `25565`.

## ✨ Próximos pasos

1.  Crear el repositorio en GitHub.
2.  Hacer push con este archivo.
3.  Te generaré todo el código completo del servidor y Docker.
