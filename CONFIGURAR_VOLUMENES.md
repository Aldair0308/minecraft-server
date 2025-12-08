# 💾 CONFIGURACIÓN DE VOLUMEN ÚNICO EN RAILWAY

## ⚠️ **IMPORTANTE: Railway Plan Gratuito = 1 Solo Volumen**

Railway en el plan gratuito solo permite **1 volumen**. Por eso vamos a usar una estrategia diferente.

---

## 📍 **CONFIGURACIÓN DEL VOLUMEN:**

### **En Railway → Settings → Volumes:**

**Crea UN SOLO volumen:**

- **Mount Path**: `/data`
- **Name**: `minecraft-data` (opcional)

**¡ESO ES TODO!** Solo necesitas ese volumen.

---

## 🔧 **CÓMO FUNCIONA:**

El servidor guardará **TODO** en `/data`:

```
/data/
  ├── world/              # Mundo principal
  ├── world_nether/       # El Nether
  ├── world_the_end/      # The End
  ├── backups/            # Backups automáticos
  ├── ops.json            # Operadores
  ├── whitelist.json      # Whitelist
  ├── banned-players.json # Jugadores baneados
  └── usercache.json      # Caché de usuarios
```

Todo en un solo lugar = **Todo persiste** ✅

---

## ✅ **DESPUÉS DE CONFIGURAR EL VOLUMEN:**

1. Railway redesplegará automáticamente
2. El servidor creará el mundo en `/data/world`
3. Los backups se guardarán en `/data/backups`
4. **TODO persistirá** entre deployments

---

## 🔍 **VERIFICAR EN LOS LOGS:**

Deberías ver:
```
💾 Configurando persistencia con volumen único...
✅ Volumen montado en /data
📁 Creando estructura de directorios...
   ✅ /data/world
   ✅ /data/world_nether
   ✅ /data/world_the_end
   ✅ /data/backups
💾 Todo se guardará en el volumen persistente
```

---

## 📦 **BACKUPS:**

Los backups se crearán cada 5 minutos en `/data/backups/`:
```
/data/backups/
  ├── world_backup_20231207_230500.tar.gz
  ├── world_backup_20231207_231000.tar.gz
  ├── world_backup_20231207_231500.tar.gz
  └── ...
```

---

## 🎯 **RESUMEN:**

| Configuración | Valor |
|---------------|-------|
| **Volúmenes necesarios** | 1 solo |
| **Mount Path** | `/data` |
| **Contenido** | Mundo + Backups + Todo |
| **Persistencia** | ✅ Total |

---

**¡Configura el volumen en `/data` y listo!** 💾✨
