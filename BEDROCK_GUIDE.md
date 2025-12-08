# 📱 Cómo Conectarse desde Minecraft Bedrock (Móviles y Consolas)

## ✅ ¡Ahora el servidor soporta AMBAS versiones!

Tu servidor ahora acepta conexiones de:
- ✅ **Minecraft Java Edition** (PC)
- ✅ **Minecraft Bedrock Edition** (Móviles, Xbox, PlayStation, Nintendo Switch, Windows 10/11)

---

## 🎮 CONEXIÓN DESDE JAVA EDITION (PC)

### Puerto: **25565**

1. Abre **Minecraft Java Edition**
2. **Multijugador** → **Agregar servidor**
3. **Dirección**: Tu dirección TCP de Railway
   ```
   monorail.proxy.rlwy.net:XXXXX
   ```
   *(El puerto que Railway te dio para el puerto 25565)*

---

## 📱 CONEXIÓN DESDE BEDROCK EDITION (Móviles/Consolas)

### Puerto: **19132** (UDP)

### 🚨 IMPORTANTE: Necesitas configurar un SEGUNDO TCP Proxy en Railway

Railway necesita exponer **DOS puertos**:
- Puerto **25565** → Para Java Edition
- Puerto **19132** → Para Bedrock Edition

---

## 📍 CONFIGURAR EL PUERTO DE BEDROCK EN RAILWAY:

### Paso 1: Ve a Railway Settings
1. Abre tu proyecto en Railway
2. Click en el servicio **minecraft-server**
3. Ve a **Settings** → **Networking**

### Paso 2: Agrega el puerto 19132
1. En la sección **"Public Networking"**
2. Busca donde dice **"Exposed Ports"** o similar
3. Agrega el puerto **19132** con protocolo **UDP**

Railway te dará **DOS direcciones**:
```
Puerto 25565 (Java):
  Host: monorail.proxy.rlwy.net
  Port: 47382  ← Ejemplo

Puerto 19132 (Bedrock):
  Host: monorail.proxy.rlwy.net
  Port: 51234  ← Ejemplo (será diferente)
```

---

## 📱 CONECTARSE DESDE MÓVIL (Android/iOS):

### Opción 1: Agregar servidor directamente (si Railway lo permite)

1. Abre **Minecraft** en tu móvil
2. Ve a **Jugar** → **Servidores**
3. Scroll hasta abajo y toca **"Agregar servidor"**
4. **Nombre del servidor**: El que quieras
5. **Dirección del servidor**: La IP de Railway (sin puerto)
   ```
   monorail.proxy.rlwy.net
   ```
6. **Puerto**: El puerto que Railway te dio para 19132
   ```
   51234
   ```
   *(Tu puerto será diferente)*
7. Toca **"Guardar"** y **"Jugar"**

### Opción 2: Usar una app externa (recomendado si la Opción 1 no funciona)

Algunas versiones de Bedrock no permiten agregar servidores personalizados directamente. En ese caso:

**Para Android:**
1. Descarga **"MC Server Connector"** o **"Bedrock Together"** de Google Play
2. Agrega la dirección y puerto de Railway
3. La app creará un servidor local que redirige al tuyo

**Para iOS:**
1. Usa **"BedrockConnect"** o similar
2. Sigue las instrucciones de la app

---

## 🎮 CONECTARSE DESDE CONSOLAS:

### Xbox / PlayStation / Nintendo Switch:

Estas consolas **NO permiten** agregar servidores personalizados directamente. Necesitas:

1. **Usar BedrockConnect** (servicio externo)
2. **Configurar DNS personalizado** en la consola
3. Seguir las instrucciones de: https://github.com/Pugmatt/BedrockConnect

---

## 🖥️ CONECTARSE DESDE WINDOWS 10/11 (Bedrock Edition):

1. Abre **Minecraft** (versión de Microsoft Store)
2. Ve a **Jugar** → **Servidores**
3. **Agregar servidor**
4. **Dirección**: `monorail.proxy.rlwy.net`
5. **Puerto**: El puerto de Railway para 19132
6. **Guardar y Jugar**

---

## 🔍 VERIFICAR QUE GEYSER ESTÁ FUNCIONANDO:

### En los logs de Railway:

Busca estas líneas:
```
📱 Configurando soporte para Minecraft Bedrock (móviles y consolas)...
📥 Descargando Geyser (traductor Java-Bedrock)...
✅ Geyser descargado correctamente
✅ Geyser configurado para Bedrock Edition
🎮 Iniciando Geyser (soporte Bedrock)...
✅ Geyser iniciado (PID: XXXX)
📱 Jugadores de Java Edition: Conéctate al puerto 25565
📱 Jugadores de Bedrock Edition: Conéctate al puerto 19132
```

También deberías ver logs de Geyser:
```
[Geyser-Standalone] Started Geyser on 0.0.0.0:19132
```

---

## 📋 RESUMEN DE PUERTOS:

| Plataforma | Puerto | Protocolo | Dirección |
|------------|--------|-----------|-----------|
| **Java Edition** (PC) | 25565 | TCP | `monorail.proxy.rlwy.net:XXXXX` |
| **Bedrock Edition** (Móvil/Consola) | 19132 | UDP | `monorail.proxy.rlwy.net:YYYYY` |

---

## ⚠️ LIMITACIONES DE BEDROCK:

1. **Skins personalizados**: Los jugadores de Bedrock verán skins por defecto
2. **Algunos comandos**: Pueden no funcionar igual que en Java
3. **Mods/Plugins**: Solo funcionan los compatibles con Geyser
4. **Rendimiento**: Geyser usa ~512MB de RAM adicional

---

## 🐛 TROUBLESHOOTING:

### "No puedo conectarme desde móvil"
1. ✅ Verifica que Railway tenga el puerto 19132 expuesto
2. ✅ Asegúrate de usar el puerto correcto (el que Railway te dio)
3. ✅ Verifica que Geyser esté corriendo en los logs
4. ✅ Intenta usar una app como "MC Server Connector"

### "El servidor no aparece en la lista"
- Bedrock Edition a veces tarda en detectar servidores
- Intenta agregar manualmente con IP y puerto

### "Dice 'No se puede conectar al servidor'"
1. Verifica que el deployment esté "Active"
2. Revisa los logs para errores de Geyser
3. Asegúrate de usar el puerto UDP (19132)

---

## ✅ CHECKLIST FINAL:

- [ ] Servidor desplegado en Railway
- [ ] Puerto 25565 (TCP) expuesto para Java
- [ ] Puerto 19132 (UDP) expuesto para Bedrock
- [ ] Logs muestran "Geyser iniciado"
- [ ] Dirección TCP copiada para Java
- [ ] Dirección UDP copiada para Bedrock
- [ ] ¡Todos pueden jugar juntos! 🎮

---

## 🎉 ¡AHORA TUS AMIGOS PUEDEN JUGAR DESDE CUALQUIER DISPOSITIVO!

- PC (Java) ✅
- Android ✅
- iOS ✅
- Xbox ✅
- PlayStation ✅
- Nintendo Switch ✅
- Windows 10/11 (Bedrock) ✅

**¡Todos en el mismo servidor!** 🚀
