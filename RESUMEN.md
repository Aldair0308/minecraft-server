# 🎮 RESUMEN: Servidor Minecraft Java + Bedrock

## ✅ ¡CONFIGURACIÓN COMPLETADA!

Tu servidor ahora soporta **AMBAS versiones** de Minecraft:
- ✅ **Java Edition** (PC)
- ✅ **Bedrock Edition** (Móviles, Xbox, PlayStation, Nintendo Switch, Windows 10/11)

---

## 📡 PUERTOS CONFIGURADOS:

| Versión | Puerto | Protocolo | Uso |
|---------|--------|-----------|-----|
| **Java Edition** | 25565 | TCP | PC (Java) |
| **Bedrock Edition** | 19132 | UDP | Móviles, Consolas |

---

## 🚀 PASOS PARA QUE TUS AMIGOS SE CONECTEN:

### 1️⃣ **Configura Railway (IMPORTANTE)**

Necesitas exponer **DOS puertos** en Railway:

#### En Railway → Settings → Networking:

1. **Puerto 25565 (TCP)** - Para Java Edition
   - Railway te dará: `monorail.proxy.rlwy.net:XXXXX`
   
2. **Puerto 19132 (UDP)** - Para Bedrock Edition
   - Agrega este puerto manualmente en Railway
   - Railway te dará: `monorail.proxy.rlwy.net:YYYYY`

---

### 2️⃣ **Conexión desde Java Edition (PC)**

1. Abre **Minecraft Java Edition**
2. **Multijugador** → **Agregar servidor**
3. **Dirección**: 
   ```
   monorail.proxy.rlwy.net:XXXXX
   ```
   *(El puerto que Railway te dio para 25565)*

---

### 3️⃣ **Conexión desde Bedrock Edition (Móviles)**

#### Android / iOS:

1. Abre **Minecraft** en tu móvil
2. **Jugar** → **Servidores**
3. **Agregar servidor**
4. **Dirección**: `monorail.proxy.rlwy.net`
5. **Puerto**: `YYYYY` *(El puerto que Railway te dio para 19132)*

#### Si no puedes agregar servidores:
- Descarga **"MC Server Connector"** (Android)
- Descarga **"BedrockConnect"** (iOS)
- Usa la app para conectarte

---

### 4️⃣ **Conexión desde Windows 10/11 (Bedrock)**

1. Abre **Minecraft** (Microsoft Store)
2. **Jugar** → **Servidores**
3. **Agregar servidor**
4. **Dirección**: `monorail.proxy.rlwy.net`
5. **Puerto**: `YYYYY`

---

### 5️⃣ **Conexión desde Consolas (Xbox/PS/Switch)**

Las consolas requieren pasos adicionales:
- Usa **BedrockConnect**: https://github.com/Pugmatt/BedrockConnect
- Configura DNS personalizado en la consola
- Sigue las instrucciones del repositorio

---

## 🔍 VERIFICAR QUE TODO FUNCIONA:

### En Railway → Deployments → View Logs:

Deberías ver:
```
🚀 Iniciando servidor de Minecraft...
✅ Servidor ya existe, usando versión existente
📱 Configurando soporte para Minecraft Bedrock (móviles y consolas)...
📥 Descargando Geyser (traductor Java-Bedrock)...
✅ Geyser descargado correctamente
✅ Geyser configurado para Bedrock Edition
🎮 Iniciando Geyser (soporte Bedrock)...
✅ Geyser iniciado (PID: XXXX)
🎮 Iniciando servidor Minecraft Java Edition con 1G - 2G de RAM...
⚠️  Pausa automática DESACTIVADA - El servidor permanecerá activo 24/7
📱 Jugadores de Java Edition: Conéctate al puerto 25565
📱 Jugadores de Bedrock Edition: Conéctate al puerto 19132
[Server thread/INFO]: Done (X.XXXs)! For help, type "help"
[Geyser-Standalone] Started Geyser on 0.0.0.0:19132
```

---

## ⚙️ CARACTERÍSTICAS INCLUIDAS:

✅ **Última versión de Minecraft** (1.21.x)  
✅ **Modo no premium** (online-mode: false)  
✅ **Sin pausa automática** (servidor 24/7)  
✅ **Soporte Java + Bedrock** (todos pueden jugar juntos)  
✅ **Optimizado con flags de Aikar**  
✅ **Healthcheck automático**  
✅ **Reinicio automático** si se cae  

---

## 📱 PLATAFORMAS SOPORTADAS:

- ✅ PC (Java Edition)
- ✅ Android (Bedrock)
- ✅ iOS (Bedrock)
- ✅ Xbox (Bedrock)
- ✅ PlayStation (Bedrock)
- ✅ Nintendo Switch (Bedrock)
- ✅ Windows 10/11 (Bedrock)

---

## 🐛 PROBLEMAS COMUNES:

### "No puedo conectarme desde móvil"
1. Verifica que Railway tenga el puerto **19132 UDP** expuesto
2. Usa el puerto correcto que Railway te dio
3. Intenta con una app como "MC Server Connector"

### "El servidor se pausa"
- Espera a que termine el nuevo deployment
- Los logs deben mostrar: `⚠️ Pausa automática DESACTIVADA`

### "Anfitrión desconocido"
- Estás usando la dirección incorrecta
- Usa la dirección TCP Proxy de Railway, NO el dominio HTTPS

---

## 📚 ARCHIVOS DE AYUDA:

- **BEDROCK_GUIDE.md** - Guía detallada para Bedrock
- **COMO_CONECTARSE.md** - Cómo obtener la dirección TCP
- **RAILWAY_SETUP.md** - Configuración de Railway
- **DEPLOY.md** - Guía de deployment

---

## ✅ CHECKLIST FINAL:

- [ ] Código subido a GitHub (git push completado)
- [ ] Railway redesplegando el servidor
- [ ] Puerto 25565 (TCP) expuesto en Railway
- [ ] Puerto 19132 (UDP) expuesto en Railway
- [ ] Dirección TCP para Java copiada
- [ ] Dirección UDP para Bedrock copiada
- [ ] Logs muestran "Geyser iniciado"
- [ ] Logs muestran "Pausa automática DESACTIVADA"
- [ ] ¡Todos pueden jugar! 🎉

---

## 🎯 PRÓXIMOS PASOS:

1. **Espera** a que Railway termine de redesplegar (2-5 minutos)
2. **Verifica los logs** para confirmar que Geyser está corriendo
3. **Obtén las direcciones TCP** de Railway (puertos 25565 y 19132)
4. **Comparte las direcciones** con tus amigos:
   - Java: `monorail.proxy.rlwy.net:XXXXX`
   - Bedrock: `monorail.proxy.rlwy.net:YYYYY`
5. **¡A jugar!** 🎮

---

## 💡 NOTAS IMPORTANTES:

- **Geyser usa ~512MB de RAM adicional**
- **Los jugadores de Bedrock verán skins por defecto**
- **Algunos plugins pueden no ser compatibles con Bedrock**
- **El servidor NO se pausará nunca** (24/7 activo)

---

¡Disfruta tu servidor multiplataforma! 🚀✨
