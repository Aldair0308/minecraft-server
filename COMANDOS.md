# 🎮 COMANDOS Y TRUCOS HABILITADOS

## ✅ **COMANDOS DISPONIBLES:**

Los siguientes comandos están habilitados en el servidor:

### **📍 Teletransporte:**
```
/tp <jugador> <x> <y> <z>
/tp <jugador1> <jugador2>
/tp <x> <y> <z>
```

### **🌦️ Clima:**
```
/weather clear          # Despeja el clima
/weather rain           # Activa la lluvia
/weather thunder        # Activa tormenta
```

### **⏰ Tiempo:**
```
/time set day           # Cambia a día
/time set night         # Cambia a noche
/time set 0             # Amanecer
/time set 6000          # Mediodía
/time set 12000         # Atardecer
/time set 18000         # Medianoche
```

### **🎮 Modo de juego:**
```
/gamemode survival <jugador>
/gamemode creative <jugador>
/gamemode adventure <jugador>
/gamemode spectator <jugador>
```

### **💪 Efectos:**
```
/effect give <jugador> <efecto> <duración> <amplificador>
/effect clear <jugador>
```

### **🎁 Items:**
```
/give <jugador> <item> <cantidad>
```

### **🔧 Otros útiles:**
```
/kill <jugador>                    # Mata a un jugador
/difficulty <peaceful|easy|normal|hard>  # Cambia dificultad
/gamerule <regla> <valor>          # Cambia reglas del juego
/setworldspawn                     # Establece spawn del mundo
/spawnpoint <jugador>              # Establece spawn de jugador
```

---

## 👑 **CÓMO HACERTE OPERADOR (OP):**

Para usar estos comandos, necesitas ser **operador** del servidor.

### **Método 1: Desde la consola de Railway (Recomendado)**

1. Ve a **Railway → Deployments → View Logs**
2. En la parte inferior, hay una **consola interactiva**
3. Escribe:
   ```
   op TuNombreDeUsuario
   ```
4. Presiona Enter

### **Método 2: Crear archivo ops.json**

Crea un archivo `ops.json` con este contenido:

```json
[
  {
    "uuid": "00000000-0000-0000-0000-000000000000",
    "name": "TuNombreDeUsuario",
    "level": 4,
    "bypassesPlayerLimit": false
  }
]
```

**Nota:** En modo offline, el UUID no importa mucho, pero puedes usar cualquier UUID válido.

### **Método 3: Desde el juego (si ya eres OP)**

Si ya eres operador, puedes hacer OP a otros jugadores:
```
/op NombreDelJugador
```

---

## 🎯 **NIVELES DE OPERADOR:**

| Nivel | Permisos |
|-------|----------|
| **1** | Bypass spawn protection |
| **2** | Usar command blocks + Nivel 1 |
| **3** | Usar comandos de jugadores (/tp, /give, etc.) + Nivel 2 |
| **4** | Todos los comandos (/stop, /op, etc.) + Nivel 3 |

Por defecto, el servidor usa **nivel 4** (configurado en `op-permission-level=4`).

---

## 🔧 **REGLAS DEL JUEGO ÚTILES:**

Puedes cambiar estas reglas con `/gamerule`:

```
/gamerule doDaylightCycle false    # Detiene el ciclo día/noche
/gamerule doWeatherCycle false     # Detiene el ciclo del clima
/gamerule keepInventory true       # Mantiene inventario al morir
/gamerule doMobSpawning false      # Desactiva spawn de mobs
/gamerule doFireTick false         # Desactiva propagación de fuego
/gamerule mobGriefing false        # Mobs no destruyen bloques
/gamerule commandBlockOutput false # Oculta output de command blocks
/gamerule announceAdvancements true # Anuncia logros
```

---

## 📋 **COMANDOS MÁS USADOS:**

### **Para jugar cómodo:**
```
/weather clear
/time set day
/gamemode creative
/give @s diamond 64
/tp ~ ~10 ~
```

### **Para administrar:**
```
/op NombreJugador
/deop NombreJugador
/whitelist add NombreJugador
/whitelist remove NombreJugador
/ban NombreJugador
/pardon NombreJugador
/kick NombreJugador
```

### **Para el mundo:**
```
/setworldspawn
/difficulty peaceful
/gamerule keepInventory true
/save-all
```

---

## ⚠️ **IMPORTANTE:**

### **Para usar comandos necesitas:**
1. ✅ Ser operador (OP) del servidor
2. ✅ Estar en el servidor (conectado)
3. ✅ Escribir el comando en el chat (con `/` al inicio)

### **Si no eres OP:**
- ❌ No podrás usar comandos
- ❌ Verás mensaje: "You do not have permission to use this command"

### **Cómo verificar si eres OP:**
- Intenta usar `/help` en el chat
- Si ves la lista de comandos, eres OP
- Si dice "no permission", no eres OP

---

## 🎮 **EJEMPLO DE USO:**

1. **Conéctate al servidor**
2. **Abre el chat** (tecla `T` o `/`)
3. **Escribe el comando:**
   ```
   /weather clear
   ```
4. **Presiona Enter**
5. **¡Listo!** El clima se despejará

---

## 🔐 **SEGURIDAD:**

- Solo da OP a personas de confianza
- Los OPs pueden usar `/stop` (detiene el servidor)
- Los OPs pueden usar `/op` (dar OP a otros)
- Puedes quitar OP con `/deop NombreJugador`

---

## 📝 **LISTA DE OPS:**

Los operadores se guardan en el archivo `ops.json` en el servidor.

Para ver quién es OP, usa:
```
/list
```

Los OPs aparecen con un símbolo especial en la lista.

---

**¡Ahora puedes usar todos los comandos que necesites!** 🎮✨

**Recuerda:** Primero debes hacerte OP usando la consola de Railway o creando el archivo `ops.json`.
