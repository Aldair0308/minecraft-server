# Servidor Minecraft Java + Bedrock Edition - Actualizado
# Usa la imagen oficial de Eclipse Temurin con Java 21 (recomendado para Minecraft 1.20+)
FROM eclipse-temurin:21-jre-jammy

# Establece el directorio de trabajo
WORKDIR /minecraft

# Instala wget, curl, procps y otras utilidades necesarias
RUN apt-get update && \
    apt-get install -y wget curl jq procps unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia los archivos de configuración
COPY server.properties /minecraft/server.properties
COPY eula.txt /minecraft/eula.txt
COPY start.sh /minecraft/start.sh
COPY healthcheck.sh /minecraft/healthcheck.sh

# Da permisos de ejecución a los scripts
RUN chmod +x /minecraft/start.sh /minecraft/healthcheck.sh

# Expone el puerto del servidor de Minecraft Java Edition
EXPOSE 25565

# Expone el puerto del servidor de Minecraft Bedrock Edition (Geyser)
EXPOSE 19132/udp

# Variables de entorno por defecto
ENV MEMORY_MAX=2G
ENV MEMORY_MIN=1G
ENV SERVER_VERSION=latest
ENV ENABLE_GEYSER=true

# Healthcheck para mantener el contenedor activo
HEALTHCHECK --interval=30s --timeout=10s --start-period=120s --retries=3 \
    CMD /minecraft/healthcheck.sh

# Ejecuta el script de inicio
CMD ["/minecraft/start.sh"]
