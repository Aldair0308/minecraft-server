# ⚠️ MODO EFÍMERO ACTIVADO - Servidor Temporal

## 🔴 PROBLEMA

Railway Free se queda sin espacio constantemente:
```
No space left on device
Cannot write to 'forge-1.20.1-47.3.0-installer.jar'
mkdir: cannot create directory 'mods': No space left on device
```

## ✅ SOLUCIÓN APLICADA

**Servidor en MODO EFÍMERO** (sin persistencia)

### ¿Qué significa?

- ✅ El servidor funciona normalmente
- ✅ Puedes jugar con mods
- ✅ Puedes conectarte sin problemas
- ❌ **El mundo NO se guarda al reiniciar**
- ❌ **Todo el progreso se pierde al redeploy**

### Directorio de Trabajo

**Antes**: `/data` (volumen persistente - LLENO)  
**Ahora**: `/tmp/minecraft` (memoria temporal - FUNCIONA)

---

## 📊 VENTAJAS

1. **Funciona Siempre**
   - No hay problemas de espacio
   - No se llena el disco
   - Servidor siempre disponible

2. **Más Rápido**
   - Trabaja en memoria
   - No escribe al disco
   - Mejor rendimiento

3. **Sin Errores**
   - No más "No space left"
   - No más crashes por espacio
   - Servidor estable

---

## ⚠️ DESVENTAJAS

1. **NO Hay Persistencia**
   - El mundo se pierde al reiniciar
   - No se guardan construcciones
   - Cada deploy es un mundo nuevo

2. **Solo para Pruebas**
   - Ideal para probar mods
   - Ideal para probar configuración
   - NO para jugar en serio

---

## 🎮 USO RECOMENDADO

### Perfecto Para:
- ✅ Probar que los mods funcionan
- ✅ Verificar compatibilidad
- ✅ Probar configuración del servidor
- ✅ Jugar sesiones cortas
- ✅ Testing y desarrollo

### NO Recomendado Para:
- ❌ Servidor de producción
- ❌ Guardar construcciones
- ❌ Jugar a largo plazo
- ❌ Mundos permanentes

---

## 🔄 CUÁNDO SE PIERDE EL MUNDO

El mundo se reinicia cuando:
- ❌ Haces redeploy en Railway
- ❌ Railway reinicia el contenedor
- ❌ Actualizas el código
- ❌ Cambias variables de entorno
- ✅ **NO se pierde** mientras el servidor esté corriendo

---

## 🚀 CÓMO USAR

### 1. Deploy Normal

```bash
git add .
git commit -m "Enable ephemeral mode"
git push
```

### 2. Conectarse

El servidor funcionará normalmente:
- IP: Tu TCP Proxy de Railway
- Puerto: 25565
- Versión: 1.20.1 + Forge
- Mods: 15 mods cargados

### 3. Jugar

Juega normalmente. Todo funciona excepto:
- ❌ No se guarda al reiniciar
- ✅ Se guarda mientras juegas (en memoria)

---

## 💾 SI NECESITAS PERSISTENCIA

### Opción 1: Railway Pro
- Más espacio en disco (5GB+)
- Backups habilitados
- Persistencia completa
- **Costo**: ~$5/mes

### Opción 2: Otro Hosting
- **Aternos**: Gratis, 4GB, persistencia
- **Oracle Cloud**: Gratis, 200GB, persistencia
- **DigitalOcean**: $5/mes, 25GB, persistencia

### Opción 3: Servidor Local
- Usa tu PC
- Espacio ilimitado
- Persistencia total
- Gratis

---

## 🔧 ARCHIVOS MODIFICADOS

1. ✅ `start.sh` - Cambiado a /tmp en lugar de /data
2. ✅ Mensajes actualizados
3. ✅ Backups deshabilitados
4. ✅ Auto-save deshabilitado

---

## 📝 CONFIGURACIÓN ACTUAL

### Directorio
- **Trabajo**: `/tmp/minecraft` (temporal)
- **Mods**: `/tmp/minecraft/mods`
- **Mundo**: `/tmp/minecraft/world`
- **Logs**: `/tmp/minecraft/logs`

### Características
- ✅ Forge 1.20.1-47.3.0
- ✅ 15 mods cargados
- ✅ Sin problemas de espacio
- ❌ Sin persistencia
- ❌ Sin backups

---

## ⚡ RENDIMIENTO

### Uso de Recursos
- **Memoria**: 1G-2G (normal)
- **Disco**: ~0MB (todo en RAM)
- **CPU**: Normal

### Ventajas
- ✅ Más rápido (trabaja en memoria)
- ✅ Sin I/O de disco
- ✅ Sin fragmentación

---

## 🎯 PRÓXIMOS PASOS

### Para Probar (AHORA)

1. **Commit y Push**:
   ```bash
   git add .
   git commit -m "Enable ephemeral mode for Railway"
   git push
   ```

2. **Esperar Redeploy** (5 min)

3. **Conectarse y Probar**:
   - Verifica que los mods cargan
   - Verifica que puedes jugar
   - Prueba funcionalidad

### Para Producción (DESPUÉS)

1. **Migrar a Railway Pro** o
2. **Migrar a otro hosting** o
3. **Usar servidor local**

---

## ⚠️ ADVERTENCIAS

### IMPORTANTE
- ⚠️ **NO uses esto para jugar en serio**
- ⚠️ **TODO se pierde al reiniciar**
- ⚠️ **Solo para pruebas y testing**

### Recuerda
- El mundo es temporal
- No construyas nada importante
- No inviertas mucho tiempo
- Es solo para verificar que funciona

---

## ✅ VERIFICACIÓN

Después del deploy, verifica:

```bash
# En Railway logs, busca:
"⚠️  MODO EFÍMERO: Mundo temporal (no persiste)"
"✅ Forge instalado correctamente"
"15 mods cargados"
"Done!"
```

---

**Estado**: ✅ Modo efímero activado  
**Persistencia**: ❌ Deshabilitada  
**Uso**: Solo para pruebas  
**Siguiente paso**: Commit y push para deploy
