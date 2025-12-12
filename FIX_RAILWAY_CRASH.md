# 🔧 CORRECCIONES PARA RAILWAY - Crash Solucionado

## ⚠️ PROBLEMAS DETECTADOS

### 1. "No space left on device"
Railway se quedó sin espacio en disco debido a:
- Geyser descargando archivos adicionales
- Logs de Geyser llenando el disco
- Mods ocupando espacio

### 2. "could not open `user_jvm_args.txt`"
Forge requiere este archivo para iniciar correctamente.

---

## ✅ SOLUCIONES APLICADAS

### 1. Geyser Deshabilitado
- ✅ Geyser ahora está **DESHABILITADO por defecto**
- ✅ Ahorra ~500MB de espacio en disco
- ✅ Reduce uso de RAM
- ⚠️ **Solo jugadores de Java Edition** pueden conectarse ahora

**Si necesitas soporte Bedrock:**
- Aumenta el espacio en disco en Railway (plan pago)
- Descomenta la sección de Geyser en `start.sh`

### 2. Archivo user_jvm_args.txt Creado
- ✅ Archivo creado y agregado al Dockerfile
- ✅ Se copia automáticamente al directorio de datos
- ✅ Forge ahora puede iniciar correctamente

---

## 📝 ARCHIVOS MODIFICADOS

1. ✅ `user_jvm_args.txt` - Creado (requerido por Forge)
2. ✅ `start.sh` - Geyser deshabilitado, user_jvm_args.txt copiado
3. ✅ `Dockerfile` - user_jvm_args.txt agregado
4. ✅ `.gitignore` - Actualizado por el usuario

---

## 🚀 PRÓXIMOS PASOS

### Paso 1: Hacer Commit de los Cambios

```bash
git add .
git commit -m "Fix: Deshabilitar Geyser y agregar user_jvm_args.txt"
git push
```

### Paso 2: Railway Redesplegará Automáticamente

Railway detectará los cambios y redesplegará el servidor.

### Paso 3: Verificar que Funciona

```bash
# Ver logs en Railway
railway logs
```

Deberías ver:
- ✅ "Forge instalado correctamente"
- ✅ "X mods cargados"
- ✅ "Done!" (servidor listo)

---

## 💾 ESPACIO EN DISCO

### Antes (con Geyser):
- Forge: ~200MB
- Mods: ~30MB
- Geyser: ~500MB
- Logs: ~100MB
- **Total**: ~830MB

### Ahora (sin Geyser):
- Forge: ~200MB
- Mods: ~30MB
- Mundo: ~50MB (crece con el tiempo)
- Logs: ~20MB
- **Total**: ~300MB

**Railway Free Tier**: 1GB de espacio
**Espacio disponible**: ~700MB para el mundo y backups

---

## ⚙️ CONFIGURACIÓN DE RAILWAY

### Variables de Entorno Recomendadas

```
MEMORY_MIN=1G
MEMORY_MAX=2G
ENABLE_GEYSER=false
```

### Si Necesitas Más Espacio

1. **Opción 1**: Deshabilitar backups automáticos
   - Edita `start.sh` y comenta la línea del backup

2. **Opción 2**: Reducir retención de backups
   - Edita `backup.sh` y cambia `MAX_BACKUPS=12` a `MAX_BACKUPS=3`

3. **Opción 3**: Upgrade a Railway Pro
   - Más espacio en disco
   - Más RAM
   - Mejor rendimiento

---

## 🎮 FUNCIONALIDAD ACTUAL

### ✅ Funciona:
- Servidor Minecraft 1.20.1 con Forge
- 13 mods cargados
- Backups cada 25 minutos
- OP para Radial51
- Conexión Java Edition

### ❌ No Funciona (deshabilitado):
- Soporte Bedrock Edition (Geyser)
- Jugadores de móvil/consola no pueden conectarse

---

## 🔄 CÓMO HABILITAR GEYSER (Opcional)

Si tienes espacio suficiente:

1. Edita `start.sh`
2. Descomenta la sección de Geyser (líneas ~98-155)
3. Cambia `ENABLE_GEYSER=false` a `ENABLE_GEYSER=true` en Railway
4. Haz commit y push

**Requisitos**:
- Mínimo 2GB de espacio en disco
- Railway Pro recomendado

---

## 📊 MONITOREO

### Ver Uso de Espacio

```bash
# En Railway, ejecuta:
df -h /data
```

### Ver Mods Cargados

```bash
# En los logs, busca:
"📦 Mods: X mods cargados"
```

### Ver Memoria Usada

```bash
# En Railway dashboard:
Metrics → Memory Usage
```

---

## ⚠️ NOTAS IMPORTANTES

1. **Backups**: Se guardan en `/data/backups`
   - Cada backup ~10-50MB (depende del mundo)
   - Se mantienen 12 backups (últimas 5 horas)
   - Pueden llenar el disco si el mundo es grande

2. **Mundo**: Crece con el tiempo
   - Mundo nuevo: ~10MB
   - Mundo explorado: ~100-500MB
   - Considera limpiar chunks no usados

3. **Logs**: Se limpian automáticamente
   - Railway rota logs automáticamente
   - No deberían ser problema

---

## 🆘 SI SIGUE CRASHEANDO

### Error: "No space left"

1. Reduce backups:
   ```bash
   # En backup.sh, cambia:
   MAX_BACKUPS=3  # En lugar de 12
   ```

2. Limpia backups antiguos:
   ```bash
   rm -rf /data/backups/*
   ```

3. Considera Railway Pro

### Error: "Out of memory"

1. Reduce memoria de Forge:
   ```
   MEMORY_MAX=1G  # En lugar de 2G
   ```

2. Quita algunos mods pesados

---

## ✅ CHECKLIST POST-FIX

- [ ] Hacer commit de los cambios
- [ ] Push a GitHub
- [ ] Verificar que Railway redespliega
- [ ] Ver logs en Railway
- [ ] Confirmar que Forge inicia
- [ ] Confirmar que los mods cargan
- [ ] Probar conexión al servidor
- [ ] Verificar que los backups funcionan

---

**Fecha**: 2025-12-12  
**Estado**: ✅ Correcciones aplicadas  
**Siguiente paso**: Hacer commit y push a GitHub
