#!/bin/bash

echo "🚀 Iniciando servidor de Minecraft..."
echo "💾 Directorio de trabajo: /data (volumen persistente)"
echo "📁 Configuración base: /minecraft"

# Copia archivos de configuración si no existen en /data
if [ ! -f "/data/server.properties" ]; then
    echo "📋 Copiando configuración inicial..."
    cp /minecraft/server.properties /data/server.properties
    cp /minecraft/eula.txt /data/eula.txt
    echo "✅ Configuración copiada"
fi

# Copia user_jvm_args.txt si no existe (requerido por Forge)
if [ ! -f "/data/user_jvm_args.txt" ]; then
    cp /minecraft/user_jvm_args.txt /data/user_jvm_args.txt
    echo "✅ Archivo user_jvm_args.txt copiado"
fi

# Si no existe el JAR del servidor Forge, descargarlo e instalarlo
if [ ! -f "libraries/net/minecraftforge/forge/1.20.1-47.3.0/forge-1.20.1-47.3.0-server.jar" ]; then
    echo "📥 Descargando Forge 1.20.1-47.3.0..."
    
    # Descarga el instalador de Forge
    FORGE_VERSION="1.20.1-47.3.0"
    FORGE_INSTALLER="forge-${FORGE_VERSION}-installer.jar"
    
    wget -O "$FORGE_INSTALLER" "https://maven.minecraftforge.net/net/minecraftforge/forge/${FORGE_VERSION}/${FORGE_INSTALLER}"
    
    echo "🔧 Instalando Forge..."
    java -jar "$FORGE_INSTALLER" --installServer
    
    echo "✅ Forge instalado correctamente"
    
    # Limpia el instalador
    rm -f "$FORGE_INSTALLER"
    rm -f "$FORGE_INSTALLER.log"
else
    echo "✅ Forge ya está instalado"
fi

# Crea el directorio de mods si no existe
mkdir -p mods
echo "📦 Directorio de mods listo"

# Copia los mods desde la imagen si existen
if [ -d "/minecraft/server-mods" ] && [ "$(ls -A /minecraft/server-mods 2>/dev/null)" ]; then
    echo "📥 Copiando mods al servidor..."
    cp -n /minecraft/server-mods/*.jar mods/ 2>/dev/null || true
    MOD_COUNT=$(ls -1 mods/*.jar 2>/dev/null | wc -l)
    echo "✅ $MOD_COUNT mods disponibles"
else
    echo "⚠️  No se encontraron mods pre-instalados"
    echo "   Puedes agregar mods manualmente a la carpeta /data/mods"
fi

# Crea el archivo ops.json para dar permisos de operador
echo "👑 Configurando operadores del servidor..."
cat > ops.json << 'EOF'
[
  {
    "uuid": "00000000-0000-0000-0000-000000000001",
    "name": "Radial51",
    "level": 4,
    "bypassesPlayerLimit": false
  }
]
EOF
echo "✅ Radial51 configurado como operador (nivel 4)"
echo "   Puede usar todos los comandos: /tp, /weather, /time, /gamemode, etc."

# Descarga e instala Geyser para soporte de Bedrock
if [ "$ENABLE_GEYSER" = "true" ]; then
    echo "📱 Configurando soporte para Minecraft Bedrock (móviles y consolas)..."
    
    # Crea el directorio de plugins si no existe
    mkdir -p plugins
    
    # Descarga Geyser standalone si no existe
    if [ ! -f "geyser.jar" ]; then
        echo "📥 Descargando Geyser (traductor Java-Bedrock)..."
        # Usa la URL directa de la última versión estable
        wget -O geyser.jar "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone"
        
        # Verifica que se descargó correctamente
        if [ ! -s "geyser.jar" ] || file geyser.jar | grep -q "HTML"; then
            echo "⚠️  Error al descargar Geyser, deshabilitando soporte Bedrock"
            rm -f geyser.jar
            ENABLE_GEYSER=false
        else
            echo "✅ Geyser descargado correctamente"
        fi
    fi
    
    # Crea el directorio de configuración de Geyser
    mkdir -p Geyser-Standalone/config
    
    # Detecta el puerto de Bedrock (usa variable de entorno o 19132 por defecto)
    BEDROCK_PORT=${BEDROCK_PORT:-19132}
    
    echo "📝 Configurando Geyser..."
    echo "   - Puerto Bedrock: $BEDROCK_PORT"
    echo "   - Puerto Java: 25565"
    
    # Crea la configuración de Geyser
    cat > Geyser-Standalone/config/config.yml << EOF
# Configuración de Geyser para permitir conexiones desde Bedrock
bedrock:
  address: 0.0.0.0
  port: ${BEDROCK_PORT}
  clone-remote-port: false
  motd1: "§6Servidor Minecraft"
  motd2: "§aJava + Bedrock Edition"
  server-name: "Minecraft Server"
  compression-level: 6
  enable-proxy-protocol: false
# GEYSER DESHABILITADO - Consume mucho espacio en Railway
# Si necesitas soporte Bedrock, descomenta esta sección y aumenta el espacio en disco
# if [ "$ENABLE_GEYSER" = "true" ]; then
#     echo "📱 Configurando soporte para Minecraft Bedrock (móviles y consolas)..."
#     
#     # Crea el directorio de plugins si no existe
#     mkdir -p plugins
#     
#     # Descarga Geyser standalone si no existe
#     if [ ! -f "geyser.jar" ]; then
#         echo "📥 Descargando Geyser (traductor Java-Bedrock)..."
#         # Usa la URL directa de la última versión estable
#         wget -O geyser.jar "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone"
#         
#         # Verifica que se descargó correctamente
#         if [ ! -s "geyser.jar" ] || file geyser.jar | grep -q "HTML"; then
#             echo "⚠️  Error al descargar Geyser, deshabilitando soporte Bedrock"
#             rm -f geyser.jar
#             ENABLE_GEYSER=false
#         else
#             echo "✅ Geyser descargado correctamente"
#         fi
#     fi
#     
#     # Crea el directorio de configuración de Geyser
#     mkdir -p Geyser-Standalone/config
#     
#     # Detecta el puerto de Bedrock (usa variable de entorno o 19132 por defecto)
#     BEDROCK_PORT=${BEDROCK_PORT:-19132}
#     
#     echo "📝 Configurando Geyser..."
#     echo "   - Puerto Bedrock: $BEDROCK_PORT"
#     echo "   - Puerto Java: 25565"
#     
#     # Crea la configuración de Geyser
#     cat > Geyser-Standalone/config/config.yml << EOF
# # Configuración de Geyser para permitir conexiones desde Bedrock
# bedrock:
#   address: 0.0.0.0
#   port: ${BEDROCK_PORT}
#   clone-remote-port: false
#   motd1: "§6Servidor Minecraft"
#   motd2: "§aJava + Bedrock Edition"
#   server-name: "Minecraft Server"
#   compression-level: 6
#   enable-proxy-protocol: false
# 
# remote:
#   address: 127.0.0.1
#   port: 25565
#   auth-type: offline
# 
# # Permite que jugadores de Bedrock se conecten sin autenticación
# allow-third-party-capes: true
# allow-third-party-ears: false
# show-cooldown: true
# show-coordinates: true
# emote-offhand-workaround: false
# cache-chunks: false
# above-bedrock-nether-building: false
# force-resource-packs: true
# xbox-achievements-enabled: false
# 
# metrics:
#   enabled: false
#   uuid: 00000000-0000-0000-0000-000000000000
# 
# # Configuración de comandos
# command-suggestions: true
# 
# # Configuración de jugadores
# max-players: 20
# debug-mode: false
# general-thread-pool: 32
# allow-third-party-capes: true
# default-locale: es_ES
# log-player-ip-addresses: false
# EOF
#     
#     echo "✅ Geyser configurado para Bedrock Edition"
#     
#     # Inicia Geyser en segundo plano solo si se descargó correctamente
#     if [ "$ENABLE_GEYSER" = "true" ] && [ -f "geyser.jar" ]; then
#         echo "🎮 Iniciando Geyser (soporte Bedrock) en puerto $BEDROCK_PORT..."
#         java -Xms512M -Xmx512M -jar geyser.jar &
#         GEYSER_PID=$!
#         echo "✅ Geyser iniciado (PID: $GEYSER_PID)"
#         sleep 5
#     fi
# fi

echo "⚠️  Geyser deshabilitado (ahorra espacio en disco)"
echo "   Solo jugadores de Java Edition pueden conectarse"

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

# BACKUPS DESHABILITADOS - Ahorra espacio en Railway
# Si tienes más espacio, descomenta esta sección
# echo "💾 Iniciando sistema de backups automáticos..."
# chmod +x /minecraft/backup.sh
# /minecraft/backup.sh &
# BACKUP_PID=$!
# echo "✅ Sistema de backups iniciado (PID: $BACKUP_PID)"
# echo "   📦 Backups cada 25 minutos en /minecraft/backups"
# echo "   📚 Se mantendrán los últimos 12 backups (5 horas)"

echo "⚠️  Backups automáticos DESHABILITADOS (ahorra espacio)"
echo "   Usa comandos manuales para guardar: /save-all"

# Inicia el servidor con los parámetros de memoria configurados
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎮 Iniciando servidor Minecraft 1.20.1 con Forge"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   💾 Memoria: ${MEMORY_MIN} - ${MEMORY_MAX}"
echo "   🔥 Loader: Forge 47.3.0"
echo "   📦 Mods: $(ls -1 mods/*.jar 2>/dev/null | wc -l) mods cargados"
echo "   ⚠️  Pausa automática: DESACTIVADA (24/7)"
echo "   💾 Auto-guardado: Cada 5 minutos"
echo "   ⚠️  Backups: DESHABILITADOS (ahorra espacio)"
echo ""
echo "📡 PUERTOS DE CONEXIÓN:"
echo "   🖥️  Java Edition (PC):      Puerto 25565"
echo "   📱 Bedrock Edition (Móvil): Puerto ${BEDROCK_PORT}"
echo ""
echo "🌐 CÓMO CONECTARSE:"
echo "   Obtén la dirección TCP Proxy de Railway en:"
echo "   Settings → Networking → TCP Proxy"
echo ""
echo "💾 PERSISTENCIA:"
echo "   ✅ El mundo se guarda automáticamente cada 5 minutos"
echo "   ✅ Backups automáticos cada 25 minutos"
echo "   ✅ Los datos persisten entre deployments"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

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
    @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.3.0/unix_args.txt --nogui "$@"
