#!/bin/bash

echo "🚀 Iniciando servidor de Minecraft..."

# Si no existe el JAR del servidor, descargarlo
if [ ! -f "server.jar" ]; then
    echo "📥 Descargando la última versión del servidor de Minecraft..."
    
    # Obtiene la última versión estable desde la API de Mojang
    LATEST_VERSION=$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release')
    echo "📌 Versión detectada: $LATEST_VERSION"
    
    # Obtiene la URL del servidor
    VERSION_URL=$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r --arg VERSION "$LATEST_VERSION" '.versions[] | select(.id == $VERSION) | .url')
    SERVER_URL=$(curl -s "$VERSION_URL" | jq -r '.downloads.server.url')
    
    # Descarga el JAR del servidor
    wget -O server.jar "$SERVER_URL"
    echo "✅ Servidor descargado correctamente"
else
    echo "✅ Servidor ya existe, usando versión existente"
fi

# Inicia el servidor con los parámetros de memoria configurados
echo "🎮 Iniciando servidor con ${MEMORY_MIN} - ${MEMORY_MAX} de RAM..."
exec java -Xms${MEMORY_MIN} -Xmx${MEMORY_MAX} \
    -XX:+UseG1GC \
    -XX:+ParallelRefProcEnabled \
    -XX:MaxGCPauseMillis=200 \
    -XX:+UnlockExperimentalVMOptions \
    -XX:+DisableExplicitGC \
    -XX:+AlwaysPreTouch \
    -XX:G1NewSizePercent=30 \
    -XX:G1MaxNewSizePercent=40 \
    -XX:G1HeapRegionSize=8M \
    -XX:G1ReservePercent=20 \
    -XX:G1HeapWastePercent=5 \
    -XX:G1MixedGCCountTarget=4 \
    -XX:InitiatingHeapOccupancyPercent=15 \
    -XX:G1MixedGCLiveThresholdPercent=90 \
    -XX:G1RSetUpdatingPauseTimePercent=5 \
    -XX:SurvivorRatio=32 \
    -XX:+PerfDisableSharedMem \
    -XX:MaxTenuringThreshold=1 \
    -Dusing.aikars.flags=https://mcflags.emc.gs \
    -Daikars.new.flags=true \
    -jar server.jar nogui
