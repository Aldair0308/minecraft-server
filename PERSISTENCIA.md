# 💾 GUÍA DE PERSISTENCIA Y BACKUPS

## ✅ **SISTEMA DE PERSISTENCIA IMPLEMENTADO**

Tu servidor ahora tiene **3 capas de protección** para que nunca pierdas el mundo:

1. ✅ **Auto-guardado cada 5 minutos** - El servidor guarda automáticamente
2. ✅ **Backups automáticos cada 5 minutos** - Copia de seguridad comprimida
3. ✅ **Volúmenes persistentes de Railway** - Los datos sobreviven a deployments

---

## 🔧 **CÓMO FUNCIONA:**

### **1. Auto-guardado del servidor (cada 5 minutos)**

El archivo `server.properties` está configurado con:
```properties
autosave-interval=6000
```

Esto significa que cada **6000 ticks** (5 minutos), el servidor guarda automáticamente:
- Posiciones de jugadores
- Bloques colocados/destruidos
- Inventarios
- Progreso de jugadores
- Estado del mundo

### **2. Backups automáticos (cada 5 minutos)**

Un script (`backup.sh`) corre en segundo plano y:
- Crea un backup comprimido del mundo cada 5 minutos
- Guarda en `/minecraft/backups/`
- Mantiene los últimos **12 backups** (1 hora de historial)
- Elimina backups antiguos automáticamente

### **3. Volúmenes persistentes de Railway**

Railway monta volúmenes en:
- `/minecraft/world` - Mundo principal
- `/minecraft/world_nether` - El Nether
- `/minecraft/world_the_end` - El End
- `/minecraft/backups` - Backups automáticos

**Estos volúmenes persisten** incluso si:
- Haces un nuevo deployment
- Reinicias el servidor
- Actualizas el código

---

## 📦 **CÓMO DESCARGAR UN BACKUP:**

### **Opción 1: Desde Railway CLI**

```bash
# Instala Railway CLI
npm install -g @railway/cli

# Login
railway login

# Lista los backups disponibles
railway run ls -lh /minecraft/backups

# Descarga un backup específico
railway run cat /minecraft/backups/world_backup_YYYYMMDD_HHMMSS.tar.gz > backup.tar.gz
```

### **Opción 2: Desde el código (crear endpoint)**

Puedo crear un endpoint HTTP simple que te permita descargar backups desde el navegador.

### **Opción 3: Conectarte por SFTP/SCP**

Railway no ofrece SFTP directo, pero puedes usar Railway CLI para copiar archivos.

---

## 🔄 **CÓMO RESTAURAR UN BACKUP:**

### **Si necesitas volver a un backup anterior:**

1. **Detén el servidor** en Railway (Settings → Danger Zone → Pause)

2. **Usa Railway CLI:**
   ```bash
   # Sube el backup
   railway run tar -xzf backup.tar.gz -C /minecraft/
   ```

3. **Reinicia el servidor** en Railway

---

## 🚨 **QUÉ PASA EN DIFERENTES ESCENARIOS:**

### **Escenario 1: Haces un nuevo deployment (git push)**
- ✅ **El mundo persiste** - Los volúmenes NO se borran
- ✅ **Los backups persisten** - Siguen en `/minecraft/backups`
- ✅ **Los jugadores mantienen todo** - Bloques, inventarios, progreso

### **Escenario 2: El servidor se cae/reinicia**
- ✅ **El mundo persiste** - Último auto-guardado (máximo 5 min atrás)
- ✅ **Los backups persisten** - Puedes restaurar si hay corrupción

### **Escenario 3: Borras el servicio de Railway**
- ❌ **Los volúmenes se borran** - Railway elimina todo
- ⚠️ **Solución**: Descarga backups ANTES de borrar

### **Escenario 4: Cambias de plan en Railway**
- ✅ **El mundo persiste** - Los volúmenes se migran

---

## 📊 **MONITOREAR BACKUPS:**

### **Ver backups disponibles en los logs:**

Cuando el servidor inicia, verás:
```
💾 Iniciando sistema de backups automáticos...
✅ Sistema de backups iniciado (PID: XXXX)
   📦 Backups cada 5 minutos en /minecraft/backups
   📚 Se mantendrán los últimos 12 backups (1 hora)
```

Cada 5 minutos verás:
```
📦 Creando backup: world_backup_20231207_143000.tar.gz
✅ Backup creado exitosamente
📊 Tamaño del backup: 15M
📚 Backups disponibles: 8
⏳ Próximo backup en 5 minutos...
```

---

## 💡 **RECOMENDACIONES:**

### **Para máxima seguridad:**

1. **Descarga backups manualmente cada semana**
   - Usa Railway CLI
   - Guárdalos en tu PC o Google Drive

2. **Monitorea el espacio en disco**
   - Railway tiene límites de almacenamiento
   - Los backups se auto-limpian, pero verifica

3. **Prueba restaurar un backup**
   - Hazlo en local primero
   - Asegúrate de saber cómo hacerlo

### **Configuración avanzada:**

Si quieres cambiar la frecuencia de backups, edita `backup.sh`:
```bash
sleep 300  # 5 minutos (300 segundos)
```

Cambia a:
- `sleep 600` = 10 minutos
- `sleep 180` = 3 minutos
- `sleep 900` = 15 minutos

---

## 🎯 **RESUMEN:**

| Característica | Estado | Frecuencia |
|----------------|--------|------------|
| **Auto-guardado** | ✅ Activo | Cada 5 minutos |
| **Backups automáticos** | ✅ Activo | Cada 5 minutos |
| **Volúmenes persistentes** | ✅ Activo | Siempre |
| **Backups retenidos** | ✅ 12 backups | Última hora |
| **Persiste en deployments** | ✅ Sí | Siempre |

---

## ⚠️ **IMPORTANTE:**

- **NO agregues los mundos al repositorio Git** - Son muy pesados
- **El `.gitignore` ya los excluye** - No se subirán a GitHub
- **Los volúmenes de Railway son la fuente de verdad** - No el código

---

**¡Tu mundo está protegido! Juega tranquilo.** 🎮✨
