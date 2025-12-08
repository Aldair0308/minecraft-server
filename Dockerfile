# Servidor Minecraft Java + Bedrock Edition - Actualizado v2
# Usa la imagen oficial de Eclipse Temurin con Java 21 (recomendado para Minecraft 1.20+)
FROM eclipse-temurin:21-jre-jammy

# Establece el directorio de trabajo (aquí se guardará todo)
WORKDIR /data

# Instala wget, curl, procps y otras utilidades necesarias
RUN apt-get update && \
    apt-get install -y wget curl jq procps unzip bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia los archivos de configuración
COPY server.properties /data/server.properties
COPY eula.txt /data/eula.txt
COPY start.sh /data/start.sh
COPY healthcheck.sh /data/healthcheck.sh
COPY backup.sh /data/backup.sh

# Da permisos de ejecución a los scripts
RUN chmod +x /data/start.sh /data/healthcheck.sh /data/backup.sh

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
    CMD /data/healthcheck.sh

# Usa ENTRYPOINT + CMD para asegurar que el script se ejecute
ENTRYPOINT ["/bin/bash"]
CMD ["/data/start.sh"]
