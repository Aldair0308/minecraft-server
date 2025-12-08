# 🔌 CÓMO OBTENER LA DIRECCIÓN TCP CORRECTA EN RAILWAY

## ⚠️ PROBLEMA: Estás usando las direcciones INCORRECTAS

**❌ NO funcionan:**
- `minecraft-server.railway.internal:25565` (es interno de Railway)
- `minecraft-server-production-02dc.up.railway.app:25565` (es HTTPS, no TCP)

**✅ Necesitas la dirección TCP Proxy**

---

## 📍 PASOS PARA OBTENER LA DIRECCIÓN CORRECTA:

### Opción 1: Desde la interfaz web de Railway

1. **Abre Railway**: https://railway.app
2. **Selecciona tu proyecto** "minecraft-server"
3. **Click en el servicio** (el contenedor que está corriendo)
4. **Ve a la pestaña "Settings"**
5. **Scroll hasta "Networking"**
6. **Busca "Public Networking"** o **"TCP Proxy"**

Verás algo así:

```
┌─────────────────────────────────────┐
│ Public Networking                   │
├─────────────────────────────────────┤
│ TCP Proxy                           │
│ ✓ Enabled                           │
│                                     │
│ Host: monorail.proxy.rlwy.net      │
│ Port: 47382                         │
└─────────────────────────────────────┘
```

7. **Copia el Host y Port**
8. **Úsalo en Minecraft**: `monorail.proxy.rlwy.net:47382`

---

### Opción 2: Desde Railway CLI

Si tienes Railway CLI instalado:

```bash
railway status
```

Verás la información del servicio incluyendo el TCP Proxy.

---

### Opción 3: Si NO aparece TCP Proxy

Si no ves "TCP Proxy" en Networking:

1. **En "Settings" → "Networking"**
2. **Busca "Generate Domain" o "Add TCP Proxy"**
3. **Click en el botón para generar**
4. Railway creará automáticamente el proxy TCP
5. **Copia la dirección que te da**

---

## 🎮 CONECTARSE EN MINECRAFT:

1. Abre **Minecraft Java Edition**
2. Ve a **Multijugador**
3. **Agregar servidor**
4. **Dirección del servidor**: Pega la dirección TCP que copiaste
   - Ejemplo: `monorail.proxy.rlwy.net:47382`
5. **Guardar y conectar**

---

## 🔍 VERIFICAR QUE EL SERVIDOR ESTÁ CORRIENDO:

### En Railway:

1. Ve a **"Deployments"**
2. El último deployment debe estar **"Active"** (verde)
3. Click en **"View Logs"**

### Logs que debes ver:

```
🚀 Iniciando servidor de Minecraft...
✅ Servidor ya existe, usando versión existente
📝 Configurando servidor para que NO se pause...
🎮 Iniciando servidor con 1G - 2G de RAM...
⚠️  Pausa automática DESACTIVADA - El servidor permanecerá activo 24/7
[Server thread/INFO]: Done (6.093s)! For help, type "help"
```

**❌ NO debes ver:**
```
Server empty for 60 seconds, pausing
```

---

## 🐛 TROUBLESHOOTING:

### "No puedo conectarme"

1. ✅ Verifica que estés usando la dirección TCP Proxy
2. ✅ Asegúrate de que el deployment esté "Active"
3. ✅ Revisa los logs para ver si hay errores
4. ✅ Usa Minecraft Java Edition (NO Bedrock)
5. ✅ Verifica que tu versión de Minecraft sea compatible (1.21.x)

### "El servidor se sigue pausando"

- Espera a que se redespliegue con los nuevos cambios
- Los logs deben mostrar: `⚠️ Pausa automática DESACTIVADA`

### "Anfitrión desconocido"

- Estás usando la dirección incorrecta
- Asegúrate de usar el TCP Proxy, NO el dominio HTTPS

---

## 📸 CAPTURA DE PANTALLA DE EJEMPLO:

En Railway, la sección de Networking se ve así:

```
Settings
  ├── General
  ├── Variables
  ├── Networking  ← AQUÍ
  │   ├── Public Networking
  │   │   └── TCP Proxy
  │   │       ├── Host: monorail.proxy.rlwy.net
  │   │       └── Port: XXXXX  ← ESTE ES TU PUERTO
  │   └── Private Networking
  └── Danger Zone
```

---

## ✅ CHECKLIST FINAL:

- [ ] Servidor desplegado en Railway (estado "Active")
- [ ] TCP Proxy configurado en Networking
- [ ] Dirección TCP copiada (formato: `host:puerto`)
- [ ] Minecraft Java Edition instalado
- [ ] Versión compatible (1.21.x)
- [ ] Dirección TCP pegada en Minecraft
- [ ] ¡A jugar! 🎮

---

**¿Sigues sin poder conectarte?**

Comparte:
1. La dirección exacta que estás usando
2. Los últimos logs de Railway
3. El mensaje de error exacto de Minecraft

¡Y te ayudaré a resolverlo! 🚀
