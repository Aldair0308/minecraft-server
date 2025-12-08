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

# Descarga e instala Geyser para soporte de Bedrock
if [ "$ENABLE_GEYSER" = "true" ]; then
    echo "📱 Configurando soporte para Minecraft Bedrock (móviles y consolas)..."
    
    # Crea el directorio de plugins si no existe
    mkdir -p plugins
    
    # Descarga Geyser standalone si no existe
    if [ ! -f "geyser.jar" ]; then
        echo "📥 Descargando Geyser (traductor Java-Bedrock)..."
        GEYSER_URL=$(curl -s https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest | jq -r '.downloads.standalone.url')
        wget -O geyser.jar "https://download.geysermc.org${GEYSER_URL}"
        echo "✅ Geyser descargado correctamente"
    fi
    
    # Crea el directorio de configuración de Geyser
    mkdir -p Geyser-Standalone/config
    
    # Crea la configuración de Geyser
    cat > Geyser-Standalone/config/config.yml << 'EOF'
# Configuración de Geyser para permitir conexiones desde Bedrock
bedrock:
  address: 0.0.0.0
  port: 19132
  clone-remote-port: false
  motd1: "§6Servidor Minecraft"
  motd2: "§aJava + Bedrock Edition"
  server-name: "Minecraft Server"
  compression-level: 6
  enable-proxy-protocol: false

remote:
  address: 127.0.0.1
  port: 25565
  auth-type: offline

# Permite que jugadores de Bedrock se conecten sin autenticación
allow-third-party-capes: true
allow-third-party-ears: false
show-cooldown: true
show-coordinates: true
emote-offhand-workaround: false
cache-chunks: false
above-bedrock-nether-building: false
force-resource-packs: true
xbox-achievements-enabled: false

metrics:
  enabled: false
  uuid: 00000000-0000-0000-0000-000000000000

# Configuración de comandos
command-suggestions: true

# Configuración de jugadores
max-players: 20
debug-mode: false
general-thread-pool: 32
allow-third-party-capes: true
default-locale: es_ES
log-player-ip-addresses: false
EOF
    
    echo "✅ Geyser configurado para Bedrock Edition"
    
    # Inicia Geyser en segundo plano
    echo "🎮 Iniciando Geyser (soporte Bedrock)..."
    java -Xms512M -Xmx512M -jar geyser.jar &
    GEYSER_PID=$!
    echo "✅ Geyser iniciado (PID: $GEYSER_PID)"
    sleep 3
fi

# Crea el archivo de configuración para desactivar la pausa
echo "📝 Configurando servidor para que NO se pause..."
mkdir -p config
cat > config/paper-global.yml << EOF
# Configuración para desactivar la pausa automática
_version: 28
timings:
  enabled: false
chunk-loading:
  player-max-concurrent-loads: 4.0
  player-max-chunk-load-rate: 100.0
tick-rates:
  sensor:
    villager:
      secondarypoisensor: 40
  behavior:
    villager:
      validatenearbypoi: -1
EOF

# Inicia el servidor con los parámetros de memoria configurados
echo "🎮 Iniciando servidor Minecraft Java Edition con ${MEMORY_MIN} - ${MEMORY_MAX} de RAM..."
echo "⚠️  Pausa automática DESACTIVADA - El servidor permanecerá activo 24/7"
echo "📱 Jugadores de Java Edition: Conéctate al puerto 25565"
echo "📱 Jugadores de Bedrock Edition: Conéctate al puerto 19132"

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
    -Dcom.mojang.eula.agree=true \
    -Dpaper.playerconnection.keepalive=30 \
    -jar server.jar --nogui
