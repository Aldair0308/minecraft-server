# 🔧 CONFIGURAR VOLÚMENES EN RAILWAY

## ⚠️ IMPORTANTE: Debes configurar volúmenes manualmente en Railway

Railway ya no permite configurar volúmenes desde `railway.json`. Debes hacerlo desde la interfaz web.

---

## 📍 **PASOS PARA CONFIGURAR PERSISTENCIA:**

### **1. Ve a Railway → Tu Servicio → Settings**

1. Abre https://railway.app
2. Selecciona tu proyecto **minecraft-server**
3. Click en el servicio (el contenedor)
4. Ve a **"Settings"**

---

### **2. Scroll hasta "Volumes"**

Busca la sección **"Volumes"** (puede estar cerca del final de Settings)

---

### **3. Agrega los siguientes volúmenes:**

Click en **"+ New Volume"** para cada uno:

#### **Volumen 1: Mundo Principal**
- **Mount Path**: `/minecraft/world`
- **Name**: `minecraft-world` (opcional)
- Click **"Add"**

#### **Volumen 2: Nether**
- **Mount Path**: `/minecraft/world_nether`
- **Name**: `minecraft-nether` (opcional)
- Click **"Add"**

#### **Volumen 3: The End**
- **Mount Path**: `/minecraft/world_the_end`
- **Name**: `minecraft-end` (opcional)
- Click **"Add"**

#### **Volumen 4: Backups**
- **Mount Path**: `/minecraft/backups`
- **Name**: `minecraft-backups` (opcional)
- Click **"Add"**

---

### **4. Redesplegar**

Después de agregar los volúmenes:
1. Railway redesplegará automáticamente
2. O puedes forzar un redespliegue desde **Deployments**

---

## ✅ **VERIFICAR QUE FUNCIONA:**

### **En los logs, deberías ver:**

```
💾 Iniciando sistema de backups automáticos...
✅ Sistema de backups iniciado (PID: XXXX)
   📦 Backups cada 5 minutos en /minecraft/backups
   📚 Se mantendrán los últimos 12 backups (1 hora)

💾 PERSISTENCIA:
   ✅ El mundo se guarda automáticamente cada 5 minutos
   ✅ Backups automáticos cada 5 minutos
   ✅ Los datos persisten entre deployments
```

---

## 🎯 **RESULTADO:**

Con los volúmenes configurados:

- ✅ **El mundo persiste** entre deployments
- ✅ **Los backups se guardan** y persisten
- ✅ **Los jugadores mantienen todo** su progreso
- ✅ **Puedes hacer git push** sin perder datos

---

## ⚠️ **SI NO CONFIGURAS LOS VOLÚMENES:**

Sin volúmenes:
- ❌ El mundo se borra en cada deployment
- ❌ Los jugadores pierden todo su progreso
- ❌ Los backups se borran

**¡Es CRÍTICO configurar los volúmenes!**

---

## 📸 **CAPTURA DE EJEMPLO:**

La sección de Volumes en Railway se ve así:

```
Settings
  ├── General
  ├── Variables
  ├── Networking
  ├── ...
  └── Volumes  ← AQUÍ
      ├── + New Volume
      ├── Volume 1: /minecraft/world
      ├── Volume 2: /minecraft/world_nether
      ├── Volume 3: /minecraft/world_the_end
      └── Volume 4: /minecraft/backups
```

---

## 💡 **ALTERNATIVA: Railway CLI**

Si prefieres usar la terminal:

```bash
# Instala Railway CLI
npm install -g @railway/cli

# Login
railway login

# Link al proyecto
railway link

# Agrega volúmenes (comando puede variar según versión)
railway volume create minecraft-world /minecraft/world
railway volume create minecraft-nether /minecraft/world_nether
railway volume create minecraft-end /minecraft/world_the_end
railway volume create minecraft-backups /minecraft/backups
```

---

**¡Configura los volúmenes y tu mundo estará protegido!** 💾✨
