#!/bin/bash

# Healthcheck para mantener el servidor activo
# Este script verifica que el proceso de Java esté corriendo

if pgrep -f "java.*server.jar" > /dev/null; then
    echo "✅ Servidor de Minecraft está corriendo"
    exit 0
else
    echo "❌ Servidor de Minecraft no está corriendo"
    exit 1
fi
