# 🚂 Configuración de Railway para Minecraft Server

## ⚠️ IMPORTANTE: Cómo conectarse correctamente

**NO uses el dominio HTTPS** que Railway te da. Minecraft necesita una conexión TCP directa.

### 📍 Pasos para obtener la IP y Puerto correctos:

1. **Ve a tu proyecto en Railway**
2. **Click en tu servicio** (minecraft-server)
3. **Ve a la pestaña "Settings"**
4. **Busca la sección "Networking"**
5. **Haz click en "Add TCP Proxy"** (si no lo has hecho)
6. Railway te dará algo como:
   ```
   Host: monorail.proxy.rlwy.net
   Port: 12345
   ```

### 🎮 Conectarse en Minecraft:

Usa la dirección en este formato:
```
monorail.proxy.rlwy.net:12345
```

**NO uses:**
- ❌ `https://minecraft-server-production-02dc.up.railway.app:25565`
- ❌ `minecraft-server-production-02dc.up.railway.app:25565`

**SÍ usa:**
- ✅ `monorail.proxy.rlwy.net:XXXXX` (el puerto que Railway te dio)

---

## 🔧 Configuración para evitar que se pause

### 1. Variables de entorno en Railway:

Ve a **Variables** y agrega:

```
MEMORY_MIN=1G
MEMORY_MAX=2G
RAILWAY_STATIC_URL=true
```

### 2. Configuración del servicio:

El archivo `railway.json` ya está configurado con:
- ✅ `sleepApplication: false` - Evita que se pause
- ✅ `restartPolicyType: ON_FAILURE` - Reinicia si falla
- ✅ Healthcheck automático cada 30 segundos

### 3. Plan de Railway:

⚠️ **Nota importante**: El plan gratuito de Railway tiene limitaciones:
- **5 USD de crédito gratis al mes**
- Si se acaba el crédito, el servicio se pausará

**Opciones:**
1. **Hobby Plan** ($5/mes) - Sin pausas, ideal para servidores 24/7
2. **Plan gratuito** - Funciona pero puede pausarse si se acaba el crédito

---

## 📊 Verificar que el servidor está corriendo:

### En Railway:
1. Ve a **Deployments**
2. Verifica que el estado sea **"Active"** (verde)
3. Click en **"View Logs"**
4. Deberías ver: `✅ Servidor descargado correctamente` y `🎮 Iniciando servidor...`

### Logs importantes:
```
🚀 Iniciando servidor de Minecraft...
📥 Descargando la última versión del servidor de Minecraft...
📌 Versión detectada: 1.21.4
✅ Servidor descargado correctamente
🎮 Iniciando servidor con 1G - 2G de RAM...
[Server thread/INFO]: Done! For help, type "help"
```

---

## 🐛 Troubleshooting

### "Anfitrión desconocido"
- ✅ Verifica que estés usando la dirección TCP Proxy de Railway
- ✅ NO uses el dominio HTTPS
- ✅ Asegúrate de que el puerto TCP esté configurado en Railway

### El servidor se pausa después de 1 hora:
- ✅ Verifica que `railway.json` esté en el repositorio
- ✅ Asegúrate de tener créditos en Railway
- ✅ Considera actualizar al Hobby Plan ($5/mes)

### No puedo conectarme:
1. Verifica los logs en Railway
2. Asegúrate de que el deployment esté "Active"
3. Verifica que el TCP Proxy esté configurado
4. Usa la versión correcta de Minecraft (Java Edition)

### El servidor se reinicia constantemente:
- Puede ser falta de memoria RAM
- Aumenta `MEMORY_MAX` a `3G` o `4G` en las variables de entorno

---

## 💡 Recomendaciones:

1. **Usa el Hobby Plan** si quieres un servidor 24/7 sin pausas
2. **Monitorea los logs** regularmente para detectar problemas
3. **Haz backups** del mundo descargando los archivos desde Railway
4. **Configura whitelist** si quieres controlar quién entra

---

## 🔄 Actualizar el servidor:

```bash
git add .
git commit -m "Actualización del servidor"
git push origin main
```

Railway detectará los cambios y redesplegará automáticamente.

---

## 📞 Obtener la dirección correcta:

**Método 1: Desde Railway Web**
1. Settings → Networking → TCP Proxy
2. Copia el Host y Port

**Método 2: Desde los logs**
Railway mostrará la dirección en los logs de deployment.

---

¡Ahora tu servidor debería funcionar perfectamente en Railway! 🎮✨
