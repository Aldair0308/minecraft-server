# 🚀 INSTRUCCIONES FINALES - Servidor Minecraft 1.20.1 con Mods

## ✅ Lo que YA está configurado

1. ✅ **Backups cada 25 minutos** - Configurado en `backup.sh` y `start.sh`
2. ✅ **OP para Radial51** - Nivel 4 configurado en `start.sh`
3. ✅ **Forge 1.20.1** - El servidor descargará e instalará Forge automáticamente
4. ✅ **Scripts preparados** - Todo listo para copiar mods y crear modpack
5. ✅ **Documentación completa** - README para jugadores creado

## 📋 LO QUE NECESITAS HACER AHORA

### Paso 1: Descargar los Mods Manualmente ⏳

**¿Por qué manual?** CurseForge bloquea descargas automáticas por seguridad.

1. Abre el archivo: `DESCARGAR_MODS_MANUAL.md`
2. Haz clic en cada enlace (16 mods en total)
3. Descarga cada archivo .jar
4. Guárdalos en las carpetas indicadas:
   - `mods-download\both\` - 8 mods
   - `mods-download\server\` - 4 mods
   - `mods-download\client\` - 4 mods

**Tiempo estimado**: 15-20 minutos

### Paso 2: Preparar Todo Automáticamente ✨

Una vez descargados TODOS los mods, ejecuta:

```powershell
.\preparar-servidor.ps1
```

Este script hará automáticamente:
- ✅ Copiar mods al modpack del cliente
- ✅ Crear README e instrucciones para jugadores
- ✅ Comprimir modpack en ZIP
- ✅ Preparar mods para el servidor Docker
- ✅ Actualizar Dockerfile

**Tiempo estimado**: 1-2 minutos

### Paso 3: Construir y Desplegar el Servidor 🐳

```powershell
# Construir la imagen Docker con Forge y mods
docker-compose build

# Iniciar el servidor
docker-compose up -d

# Ver los logs
docker logs -f minecraft-server
```

**Tiempo estimado**: 5-10 minutos (primera vez)

### Paso 4: Compartir Modpack con Jugadores 📤

El archivo `modpack-cliente-minecraft-1.20.1.zip` contiene:
- ✅ Todos los mods necesarios
- ✅ README con instrucciones detalladas
- ✅ Lista de mods incluidos
- ✅ Instrucciones de instalación de Forge

**Opciones para compartir**:
1. Google Drive / Dropbox
2. Discord (si es menor a 25MB)
3. GitHub Releases
4. WeTransfer

---

## 📦 Lista de Mods Incluidos

### Para Servidor y Cliente (8 mods)
1. **Undead Nights** - Hordas de zombies
2. **Waystones** - Teletransporte
3. **Balm** - Dependencia
4. **Sophisticated Backpacks** - Mochilas
5. **Sophisticated Core** - Dependencia
6. **JEI** - Recetas
7. **Tree Harvester** - Tala rápida
8. **Enchanting Plus** - Encantamientos mejorados

### Solo Servidor (4 mods)
9. **YUNG's Better Villages** - Aldeas mejoradas
10. **ChoiceTheorem's Overhauled Village** - Aldeas épicas
11. **When Dungeons Arise** - Estructuras masivas
12. + Dependencia: YUNG's API

### Solo Cliente (4 mods)
13. **Embeddium** - Optimización FPS
14. **Dynamic Lights** - Luz dinámica
15. **Xaero's Minimap** - Minimapa
16. **Xaero's World Map** - Mapa del mundo

**TOTAL**: 16 mods

<!-- Mods removidos (no disponibles para 1.20.1):
- MrCrayfish's Gun Mod + Framework
- Loot Beams
-->

---

## 🎮 Configuración del Servidor

### Versión y Loader
- **Minecraft**: 1.20.1
- **Forge**: 47.3.0
- **Java**: 21

### Configuración Actual
- **Modo**: Survival
- **Dificultad**: Easy
- **PvP**: Habilitado
- **Jugadores máx**: 20
- **Online mode**: Deshabilitado (no premium)

### Backups y Persistencia
- **Backups**: Cada 25 minutos
- **Retención**: 12 backups (5 horas)
- **Auto-guardado**: Cada 5 minutos
- **Ubicación**: `/data/backups`

### Permisos
- **OP**: Radial51 (nivel 4)
- **Comandos**: Habilitados para OPs

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

# Ver mods cargados (desde dentro del contenedor)
ls -la /data/mods
```

### Minecraft (en consola del servidor)
```
/op Radial51              # Dar OP
/deop NombreJugador       # Quitar OP
/whitelist add Jugador    # Añadir a whitelist
/save-all                 # Guardar mundo
/stop                     # Detener servidor
```

---

## 📊 Estructura de Archivos

```
minecraft-server/
├── mods-download/              # Mods descargados
│   ├── both/                   # 10 mods (servidor + cliente)
│   ├── server/                 # 3 mods (solo servidor)
│   └── client/                 # 4 mods (solo cliente)
├── server-mods/                # Mods preparados para Docker
├── modpack-cliente/            # Modpack para jugadores
│   ├── mods/                   # 14 mods para cliente
│   ├── README.md               # Instrucciones completas
│   ├── LISTA_MODS.txt          # Lista de mods
│   └── INSTALAR_FORGE.txt      # Guía de Forge
├── modpack-cliente-minecraft-1.20.1.zip  # ZIP para compartir
├── Dockerfile                  # Configuración Docker
├── docker-compose.yml          # Orquestación
├── start.sh                    # Script de inicio (con Forge)
├── backup.sh                   # Backups cada 25 min
├── server.properties           # Configuración del servidor
└── preparar-servidor.ps1       # Script de preparación
```

---

## ⚠️ Notas Importantes

### Antes de Desplegar
- ✅ Descarga TODOS los 17 mods
- ✅ Ejecuta `preparar-servidor.ps1`
- ✅ Verifica que se creó `modpack-cliente-minecraft-1.20.1.zip`
- ✅ Verifica que `server-mods/` tiene 13 archivos .jar

### Memoria RAM
- **Mínimo**: 4GB (`MEMORY_MIN=2G`, `MEMORY_MAX=4G`)
- **Recomendado**: 6-8GB para mejor rendimiento
- Edita `docker-compose.yml` para ajustar:
  ```yaml
  environment:
    - MEMORY_MIN=3G
    - MEMORY_MAX=6G
  ```

### Primera Vez
- El servidor tardará más en iniciar (descarga Forge, genera mundo)
- Espera 5-10 minutos antes de intentar conectarte
- Revisa los logs: `docker logs -f minecraft-server`

### Actualizaciones
- Para agregar/quitar mods, modifica las carpetas y vuelve a ejecutar `preparar-servidor.ps1`
- Reconstruye la imagen: `docker-compose build`
- Reinicia: `docker-compose up -d`

---

## 🆘 Solución de Problemas

### "No se encontraron mods descargados"
- Descarga los mods manualmente desde `DESCARGAR_MODS_MANUAL.md`
- Verifica que están en las carpetas correctas

### "El servidor no inicia"
- Revisa logs: `docker logs minecraft-server`
- Verifica que Forge se instaló correctamente
- Aumenta la memoria RAM

### "Jugadores no pueden conectarse"
- Verifica que tienen el modpack instalado
- Verifica la IP del servidor
- Revisa que los puertos estén abiertos

### "Crash al cargar mods"
- Verifica que todos los mods son para 1.20.1
- Verifica que las dependencias están instaladas
- Revisa logs del servidor

---

## ✅ Checklist Final

Antes de decir "está listo":

- [ ] Descargados 17 mods en `mods-download/`
- [ ] Ejecutado `preparar-servidor.ps1` exitosamente
- [ ] Creado `modpack-cliente-minecraft-1.20.1.zip`
- [ ] Verificado que `server-mods/` tiene 13 mods
- [ ] Ejecutado `docker-compose build`
- [ ] Ejecutado `docker-compose up -d`
- [ ] Servidor inició correctamente (revisar logs)
- [ ] Forge cargó todos los mods
- [ ] Compartido modpack con jugadores
- [ ] Probado conexión al servidor

---

## 🎯 Próximos Pasos Después del Deploy

1. **Probar el servidor**
   - Conéctate con el modpack instalado
   - Verifica que los mods funcionan
   - Prueba los comandos de OP

2. **Compartir con jugadores**
   - Sube el ZIP a Drive/Dropbox
   - Comparte el enlace
   - Proporciona la IP del servidor

3. **Monitorear**
   - Revisa logs regularmente
   - Verifica que los backups se crean
   - Monitorea el rendimiento

4. **Disfrutar** 🎮
   - ¡A jugar!

---

**Versión**: 1.0  
**Fecha**: 2025-12-11  
**Estado**: ⏳ Pendiente de descargar mods

**Cuando completes el Paso 1 (descargar mods), ejecuta el Paso 2 y estarás listo para el deploy!**
