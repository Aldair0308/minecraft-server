#!/bin/bash

echo "🚀 Iniciando servidor de Minecraft..."
echo "⚠️  MODO EFÍMERO: El mundo NO se guardará al reiniciar"
echo "📁 Directorio de trabajo: /tmp/minecraft (temporal)"

# Cambia al directorio temporal
cd /tmp
mkdir -p minecraft
cd minecraft

# Copia archivos de configuración
echo "📋 Copiando configuración inicial..."
cp /minecraft/server.properties ./server.properties
cp /minecraft/eula.txt ./eula.txt
cp /minecraft/user_jvm_args.txt ./user_jvm_args.txt
echo "✅ Configuración copiada"

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

# GEYSER DESHABILITADO - Consume mucho espacio en Railway
# Si necesitas soporte Bedrock, descomenta esta sección y aumenta el espacio en disco
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
echo "   ⚠️  MODO EFÍMERO: Mundo temporal (no persiste)"
echo "   ⚠️  Backups: DESHABILITADOS"
echo ""
echo "📡 PUERTOS DE CONEXIÓN:"
echo "   🖥️  Java Edition (PC): Puerto 25565"
echo ""
echo "🌐 CÓMO CONECTARSE:"
echo "   Obtén la dirección TCP Proxy de Railway en:"
echo "   Settings → Networking → TCP Proxy"
echo ""
echo "⚠️  IMPORTANTE:"
echo "   ❌ El mundo NO se guardará al reiniciar el servidor"
echo "   ❌ Esto es temporal hasta solucionar el problema de espacio"
echo "   ✅ Puedes jugar normalmente mientras el servidor esté activo"
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
