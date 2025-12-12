#!/bin/bash

# Script de backup automático para Minecraft
# Se ejecuta cada 25 minutos y crea backups del mundo

BACKUP_DIR="/data/backups"
WORLD_DIR="/data/world"
MAX_BACKUPS=12  # Mantener últimos 12 backups (5 horas de historial)

# Crea el directorio de backups si no existe
mkdir -p "$BACKUP_DIR"

# Función para crear backup
create_backup() {
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    BACKUP_NAME="world_backup_${TIMESTAMP}.tar.gz"
    
    echo "📦 Creando backup: $BACKUP_NAME"
    
    # Crea el backup comprimido
    tar -czf "${BACKUP_DIR}/${BACKUP_NAME}" \
        -C /data \
        world \
        world_nether \
        world_the_end \
        2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "✅ Backup creado exitosamente: $BACKUP_NAME"
        
        # Limpia backups antiguos (mantiene solo los últimos MAX_BACKUPS)
        cd "$BACKUP_DIR"
        ls -t world_backup_*.tar.gz 2>/dev/null | tail -n +$((MAX_BACKUPS + 1)) | xargs -r rm
        
        # Muestra espacio usado
        BACKUP_SIZE=$(du -sh "${BACKUP_DIR}/${BACKUP_NAME}" | cut -f1)
        echo "📊 Tamaño del backup: $BACKUP_SIZE"
        
        # Lista backups disponibles
        BACKUP_COUNT=$(ls -1 world_backup_*.tar.gz 2>/dev/null | wc -l)
        echo "📚 Backups disponibles: $BACKUP_COUNT"
    else
        echo "❌ Error al crear backup"
    fi
}

# Loop infinito que crea backups cada 25 minutos
echo "🔄 Iniciando sistema de backups automáticos"
echo "⏱️  Frecuencia: cada 25 minutos"
echo "💾 Directorio: $BACKUP_DIR"
echo "📦 Backups a mantener: $MAX_BACKUPS"
echo ""

# Espera 10 minutos antes del primer backup (para que el servidor inicie)
echo "⏳ Esperando 10 minutos antes del primer backup..."
sleep 600

while true; do
    create_backup
    echo "⏳ Próximo backup en 25 minutos..."
    sleep 1500  # 25 minutos
done
