# Usa la imagen oficial de Eclipse Temurin con Java 21 (recomendado para Minecraft 1.20+)
FROM eclipse-temurin:21-jre-jammy

# Establece el directorio de trabajo
WORKDIR /minecraft

# Instala wget y otras utilidades necesarias
RUN apt-get update && \
    apt-get install -y wget jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia los archivos de configuración
COPY server.properties /minecraft/server.properties
COPY eula.txt /minecraft/eula.txt
COPY start.sh /minecraft/start.sh

# Da permisos de ejecución al script
RUN chmod +x /minecraft/start.sh

# Expone el puerto del servidor de Minecraft
EXPOSE 25565

# Variables de entorno por defecto
ENV MEMORY_MAX=2G
ENV MEMORY_MIN=1G
ENV SERVER_VERSION=latest

# Ejecuta el script de inicio
CMD ["/minecraft/start.sh"]
