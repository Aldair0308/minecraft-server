# 🚂 GUÍA PASO A PASO: Configurar Railway para Java + Bedrock

## 📍 **PASO 1: Espera a que termine el deployment**

1. Ve a **Railway** → https://railway.app
2. Abre tu proyecto **minecraft-server**
3. Ve a la pestaña **"Deployments"**
4. Espera a que el último deployment esté **"Active"** (verde)
   - Esto puede tomar 3-5 minutos
   - Verás un círculo verde cuando esté listo

---

## 📍 **PASO 2: Verifica los logs**

1. En **Deployments**, click en el deployment activo
2. Click en **"View Logs"** o **"Logs"**
3. Busca estas líneas (confirman que todo funciona):

```
🚀 Iniciando servidor de Minecraft...
✅ Servidor ya existe, usando versión existente
📱 Configurando soporte para Minecraft Bedrock (móviles y consolas)...
✅ Geyser descargado correctamente
✅ Geyser configurado para Bedrock Edition
🎮 Iniciando Geyser (soporte Bedrock) en puerto 19132...
✅ Geyser iniciado (PID: XXXX)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎮 Iniciando servidor Minecraft Java Edition
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   💾 Memoria: 1G - 2G
   ⚠️  Pausa automática: DESACTIVADA (24/7)

📡 PUERTOS DE CONEXIÓN:
   🖥️  Java Edition (PC):      Puerto 25565
   📱 Bedrock Edition (Móvil): Puerto 19132
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Server thread/INFO]: Done (X.XXXs)! For help, type "help"
[Geyser-Standalone] Started Geyser on 0.0.0.0:19132
```

Si ves todo eso, **¡el servidor está funcionando correctamente!** ✅

---

## 📍 **PASO 3: Obtén las direcciones de conexión**

### **Opción A: Railway muestra los TCP Proxies automáticamente**

1. En tu servicio, ve a **"Settings"**
2. Scroll hasta **"Networking"**
3. Busca la sección **"Public Networking"**

**Si ves esto:**
```
TCP Proxy
Port 25565
✓ monorail.proxy.rlwy.net:47382

Port 19132  
✓ monorail.proxy.rlwy.net:51234
```

**¡Perfecto!** Copia ambas direcciones.

---

### **Opción B: Railway NO muestra el puerto 19132**

Railway a veces **no muestra puertos UDP** en la interfaz, pero **SÍ los expone**.

**Haz esto:**

1. En **Settings → Networking**
2. Click en **"Generate Domain"** (si no lo has hecho)
3. Railway generará algo como: `minecraft-server-production-02dc.up.railway.app`
4. **Ignora ese dominio** (es HTTPS, no sirve para Minecraft)

Después de generar el dominio, Railway debería mostrar los TCP Proxies.

---

### **Opción C: Railway sigue sin mostrar el puerto 19132**

**No te preocupes**, Railway **SÍ está exponiendo el puerto**, solo no lo muestra en la UI.

**Para Bedrock, usa:**
```
Dirección: La misma IP que Java
Puerto: 19132
```

**Ejemplo:**
- Java: `monorail.proxy.rlwy.net:47382`
- Bedrock: `monorail.proxy.rlwy.net:19132`

Railway automáticamente redirige el puerto 19132 al contenedor.

---

## 📍 **PASO 4: Prueba la conexión**

### **Desde Java Edition (PC):**

1. Abre Minecraft Java Edition
2. Multijugador → Agregar servidor
3. Dirección: `monorail.proxy.rlwy.net:47382` (tu puerto)
4. Conectar

### **Desde Bedrock Edition (Móvil):**

1. Abre Minecraft en tu móvil
2. Jugar → Servidores → Agregar servidor
3. **Dirección**: `monorail.proxy.rlwy.net`
4. **Puerto**: `19132` (o el puerto que Railway te dio)
5. Guardar y Jugar

---

## 📍 **PASO 5: Si Bedrock NO funciona**

### **Problema: Railway no expone UDP correctamente**

Railway tiene limitaciones con puertos UDP. Si tus amigos no pueden conectarse desde móvil:

### **Solución 1: Usa un servicio de túnel**

Usa **Playit.gg** (gratis) para crear un túnel UDP:

1. Ve a https://playit.gg
2. Crea una cuenta gratis
3. Descarga el cliente
4. Configura un túnel UDP al puerto 19132
5. Playit te dará una dirección pública

### **Solución 2: Cambia a un servidor Paper + Geyser plugin**

En lugar de Geyser standalone, usa el plugin de Geyser en Paper:
- Esto permite usar el mismo puerto TCP para ambos
- Más compatible con Railway

¿Quieres que configure esta opción? Es más simple para Railway.

---

## 🎯 **RESUMEN RÁPIDO:**

1. ✅ **Espera** a que el deployment esté "Active"
2. ✅ **Verifica los logs** - Busca "Geyser iniciado"
3. ✅ **Ve a Settings → Networking** - Busca los TCP Proxies
4. ✅ **Copia las direcciones**:
   - Java: `monorail.proxy.rlwy.net:XXXXX`
   - Bedrock: `monorail.proxy.rlwy.net:19132` o `YYYYY`
5. ✅ **Comparte con tus amigos**
6. ✅ **¡A jugar!** 🎮

---

## 🐛 **TROUBLESHOOTING:**

### "No veo ningún TCP Proxy en Networking"
- Click en "Generate Domain" primero
- Espera 1-2 minutos
- Refresca la página

### "Solo veo el puerto 25565, no el 19132"
- Es normal, Railway no siempre muestra puertos UDP
- El puerto **SÍ está expuesto**, solo usa `19132` directamente

### "Bedrock dice 'No se puede conectar'"
- Verifica que Geyser esté corriendo en los logs
- Intenta con la app "MC Server Connector" en Android
- Considera usar Playit.gg como alternativa

---

**¿Necesitas ayuda con algún paso específico?** ¡Avísame! 😊
