# 🎮 Servidor Minecraft 1.20.1 con Forge y Mods

Servidor de Minecraft Java Edition con **17 mods**, **Forge 1.20.1**, backups automáticos cada 25 minutos, y listo para desplegar en **Docker/Railway**.

## 🚀 Estado del Proyecto

**✅ 95% COMPLETADO** - Solo falta descargar mods manualmente (~20 min)

### ✅ Lo que está listo:
- Servidor configurado con Forge 1.20.1-47.3.0
- Backups automáticos cada 25 minutos
- OP configurado para Radial51 (nivel 4)
- 17 mods seleccionados y documentados
- Modpack del cliente preparado
- Scripts de automatización completos
- Documentación completa

### ⏳ Lo que falta:
1. Descargar 17 mods desde CurseForge (manual, 15-20 min)
2. Ejecutar script de preparación (automático, 1 min)
3. Deploy del servidor (5-10 min)

---

## 📚 DOCUMENTACIÓN PRINCIPAL

### 🎯 Para Empezar
- **[ESTADO_PROYECTO.md](ESTADO_PROYECTO.md)** ← Resumen ejecutivo
- **[INSTRUCCIONES_FINALES.md](INSTRUCCIONES_FINALES.md)** ← Guía completa paso a paso
- **[DESCARGAR_MODS_MANUAL.md](DESCARGAR_MODS_MANUAL.md)** ← Enlaces de descarga de mods

### 📖 Documentación Técnica
- [REQUERIMIENTOS.md](REQUERIMIENTOS.md) - Lista completa de requerimientos
- [GUIA_MODPACKS.md](GUIA_MODPACKS.md) - Guía de implementación de modpacks
- [CHECKLIST.md](CHECKLIST.md) - Seguimiento de tareas
- [RESUMEN_CAMBIOS.md](RESUMEN_CAMBIOS.md) - Cambios realizados

### 🎮 Para Jugadores
- `modpack-cliente-minecraft-1.20.1.zip` - Modpack completo (se crea automáticamente)
- [modpack-cliente/README.md](modpack-cliente/README.md) - Instrucciones de instalación

---

## 📦 Mods Incluidos (16 total)

### 🧟 Combate y Aventura
- **Undead Nights** - Hordas de zombies mejorados
- **When Dungeons Arise** - Estructuras masivas épicas

### 🏛️ Mundo y Estructuras
- **Better Village** - Aldeas mejoradas y detalladas
- **ChoiceTheorem's Overhauled Village** - Aldeas épicas renovadas
- **Waystones** - Sistema de teletransporte

### 🎒 Utilidades
- **Sophisticated Backpacks** - Mochilas con upgrades
- **Tree Harvester** - Tala rápida de árboles
- **Enchanting Infuser** - Elige encantamientos específicos
- **JEI (Just Enough Items)** - Ver recetas

### 🎨 Visuales y Optimización
- **Embeddium** - Optimización de FPS (cliente)
- **Xaero's Minimap** - Minimapa (cliente)
- **Xaero's World Map** - Mapa del mundo (cliente)
- **Dynamic Lights** - Luz dinámica (cliente)

### 📚 Dependencias
- Balm, Sophisticated Core, YUNG's API

<!-- Mods removidos (no disponibles para 1.20.1):
- MrCrayfish's Gun Mod + Framework
- Loot Beams
-->

---

## 🚀 Inicio Rápido

### Paso 1: Descargar Mods (Manual)

```powershell
# Abre este archivo y descarga los 17 mods:
notepad DESCARGAR_MODS_MANUAL.md
```

Descarga cada mod en las carpetas indicadas:
- `mods-download\both\` - 10 mods
- `mods-download\server\` - 3 mods
- `mods-download\client\` - 4 mods

### Paso 2: Preparar Todo (Automático)

```powershell
# Ejecuta el script de preparación:
.\preparar-servidor.ps1
```

Este script:
- ✅ Copia mods al modpack del cliente
- ✅ Crea el ZIP para compartir con jugadores
- ✅ Prepara mods para el servidor Docker
- ✅ Actualiza configuraciones

### Paso 3: Desplegar Servidor

```powershell
# Construir imagen Docker
docker-compose build

# Iniciar servidor
docker-compose up -d

# Ver logs
docker logs -f minecraft-server
```

---

## ⚙️ Configuración del Servidor

### Versión y Mods
- **Minecraft**: 1.20.1
- **Loader**: Forge 47.3.0
- **Mods**: 13 mods en servidor, 14 en cliente
- **Java**: 21

### Configuración de Juego
- **Modo**: Survival
- **Dificultad**: Easy
- **PvP**: Habilitado
- **Jugadores máx**: 20
- **Online mode**: Deshabilitado (no premium)

### Backups y Persistencia
- **Backups**: Cada 25 minutos
- **Retención**: 12 backups (5 horas de historial)
- **Auto-guardado**: Cada 5 minutos
- **Ubicación**: `/data/backups`

### Permisos
- **OP**: Radial51 (nivel 4 - todos los comandos)
- **Trucos**: Habilitados para operadores

---

## 🐳 Docker

### Variables de Entorno

```yaml
environment:
  - MEMORY_MIN=2G          # RAM mínima
  - MEMORY_MAX=4G          # RAM máxima (recomendado 6-8G con mods)
  - ENABLE_GEYSER=true     # Soporte Bedrock Edition
  - BEDROCK_PORT=19132     # Puerto Bedrock
```

### Puertos

- **25565** - Minecraft Java Edition
- **19132/udp** - Minecraft Bedrock Edition (Geyser)

### Volúmenes

- `/data` - Mundo, configuración, mods, backups (persistente)

---

## 📁 Estructura del Proyecto

```
minecraft-server/
├── 📄 INSTRUCCIONES_FINALES.md    ← EMPIEZA AQUÍ
├── 📄 DESCARGAR_MODS_MANUAL.md    ← Enlaces de mods
├── 📄 preparar-servidor.ps1       ← Script automático
├── 📁 mods-download/              ← Descarga mods aquí
│   ├── both/                      ← 10 mods (servidor + cliente)
│   ├── server/                    ← 3 mods (solo servidor)
│   └── client/                    ← 4 mods (solo cliente)
├── 📁 server-mods/                ← Mods para Docker (auto)
├── 📁 modpack-cliente/            ← Modpack para jugadores
│   ├── mods/                      ← 14 mods
│   └── README.md                  ← Instrucciones
├── 📦 modpack-cliente-minecraft-1.20.1.zip  ← Para compartir
├── 🐳 Dockerfile                  ← Configuración Docker
├── 🐳 docker-compose.yml          ← Orquestación
├── 📜 start.sh                    ← Inicio con Forge
├── 📜 backup.sh                   ← Backups cada 25 min
└── 📜 server.properties           ← Configuración servidor
```

---

## 🔧 Comandos Útiles

### Docker

```powershell
# Ver logs en tiempo real
docker logs -f minecraft-server

# Detener servidor
docker-compose down

# Reiniciar servidor
docker-compose restart

# Entrar al contenedor
docker exec -it minecraft-server bash

# Ver estado
docker ps
```

### Minecraft (Consola del Servidor)

```
/op Radial51              # Dar OP
/deop NombreJugador       # Quitar OP
/whitelist add Jugador    # Añadir a whitelist
/save-all                 # Guardar mundo
/stop                     # Detener servidor
/forge mods               # Ver mods cargados
```

---

## 🌐 Despliegue en Railway

1. Conecta tu repositorio de GitHub a Railway
2. Railway detectará automáticamente el `Dockerfile`
3. Configura las variables de entorno
4. Obtén la dirección TCP Proxy en Settings → Networking
5. Comparte la IP con tus jugadores

---

## 📤 Compartir con Jugadores

### Modpack del Cliente

El archivo `modpack-cliente-minecraft-1.20.1.zip` contiene:
- ✅ 14 mods necesarios para conectarse
- ✅ README con instrucciones completas
- ✅ Guía de instalación de Forge
- ✅ Lista de mods incluidos

### Opciones para Compartir

1. **Google Drive / Dropbox** - Sube el ZIP y comparte el enlace
2. **Discord** - Si es menor a 25MB
3. **GitHub Releases** - Crea un release en tu repo
4. **WeTransfer** - Para archivos grandes

---

## 🆘 Solución de Problemas

### El servidor no inicia

```powershell
# Ver logs para diagnosticar
docker logs minecraft-server

# Verificar que Forge se instaló
docker exec -it minecraft-server ls -la /data/libraries/net/minecraftforge/forge/
```

### Jugadores no pueden conectarse

- ✅ Verifica que tienen el modpack instalado
- ✅ Verifica que usan Minecraft 1.20.1 con Forge 47.3.0
- ✅ Verifica la IP del servidor
- ✅ Verifica que los puertos están abiertos

### Bajo rendimiento

- Aumenta RAM en `docker-compose.yml`:
  ```yaml
  - MEMORY_MIN=3G
  - MEMORY_MAX=6G
  ```
- Reduce distancia de vista en `server.properties`:
  ```properties
  view-distance=8
  ```

---

## 📊 Requisitos del Sistema

### Servidor (Docker)
- **CPU**: 2+ cores
- **RAM**: 4GB mínimo, 6-8GB recomendado con mods
- **Disco**: 10GB libres
- **OS**: Linux, Windows, macOS (con Docker)

### Cliente (Jugadores)
- **Minecraft**: Java Edition 1.20.1
- **Forge**: 47.3.0
- **Java**: 17 o superior
- **RAM**: 4GB mínimo, 6GB recomendado
- **Disco**: 2GB libres

---

## 🎯 Próximos Pasos

1. **Lee**: `INSTRUCCIONES_FINALES.md`
2. **Descarga**: Los 17 mods usando `DESCARGAR_MODS_MANUAL.md`
3. **Ejecuta**: `.\preparar-servidor.ps1`
4. **Despliega**: `docker-compose up -d`
5. **Comparte**: El modpack con tus jugadores
6. **Disfruta**: ¡A jugar! 🎮

---

## 📝 Licencia

Este proyecto es de código abierto. Los mods incluidos tienen sus propias licencias.

## 👥 Créditos

- Servidor configurado para Minecraft 1.20.1
- Forge por MinecraftForge Team
- Mods por sus respectivos autores

---

**Versión**: 1.0  
**Fecha**: 2025-12-11  
**Estado**: ⏳ Pendiente de descargar mods  
**Minecraft**: 1.20.1  
**Forge**: 47.3.0
