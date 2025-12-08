# 🚀 Guía de Deployment Rápido

## ⚡ Opción 1: Deployment Local con Docker Compose (MÁS RÁPIDO)

```bash
docker-compose up -d
```

**¡Eso es todo!** El servidor estará corriendo en `localhost:25565`

Para ver los logs:
```bash
docker-compose logs -f
```

Para detener el servidor:
```bash
docker-compose down
```

---

## 🌐 Opción 2: Deployment en Railway

### Paso 1: Sube tu código a GitHub
```bash
git add .
git commit -m "Servidor Minecraft listo para deploy"
git push origin main
```

### Paso 2: Conecta con Railway
1. Ve a [railway.app](https://railway.app)
2. Haz clic en **"New Project"**
3. Selecciona **"Deploy from GitHub repo"**
4. Elige este repositorio: `minecraft-server`
5. Railway detectará automáticamente el `Dockerfile`

### Paso 3: Configura las variables de entorno (Opcional)
En Railway, ve a **Variables** y agrega:
- `MEMORY_MIN=1G`
- `MEMORY_MAX=2G`

### Paso 4: Expón el puerto
1. Ve a **Settings** → **Networking**
2. Haz clic en **"Generate Domain"** o **"Add TCP Proxy"**
3. Asegúrate de que el puerto **25565** esté expuesto

### Paso 5: ¡Listo!
Railway te dará una IP y puerto para conectarte. Usa esa dirección en Minecraft.

---

## 🐳 Opción 3: Deployment Manual con Docker

### Construir la imagen:
```bash
docker build -t minecraft-server .
```

### Ejecutar el contenedor:
```bash
docker run -d \
  --name minecraft-server \
  -p 25565:25565 \
  -e MEMORY_MIN=1G \
  -e MEMORY_MAX=2G \
  -v minecraft-data:/minecraft \
  --restart unless-stopped \
  minecraft-server
```

### Ver logs:
```bash
docker logs -f minecraft-server
```

---

## 📦 Opción 4: Subir a Docker Hub

### 1. Construir y etiquetar:
```bash
docker build -t tuusuario/minecraft-server:latest .
```

### 2. Login en Docker Hub:
```bash
docker login
```

### 3. Subir la imagen:
```bash
docker push tuusuario/minecraft-server:latest
```

### 4. Usar la imagen desde Docker Hub:
```bash
docker run -d \
  --name minecraft-server \
  -p 25565:25565 \
  tuusuario/minecraft-server:latest
```

---

## 🎮 Conectarse al Servidor

1. Abre Minecraft Java Edition (versión no premium)
2. Ve a **Multijugador** → **Agregar servidor**
3. Dirección del servidor:
   - **Local**: `localhost:25565`
   - **Railway**: La IP/dominio que te dio Railway
   - **Otro**: La IP de tu servidor + `:25565`

---

## ⚙️ Configuración Avanzada

### Cambiar la memoria RAM:
Edita el archivo `docker-compose.yml` o las variables de entorno:
```yaml
environment:
  - MEMORY_MIN=2G
  - MEMORY_MAX=4G
```

### Modificar configuración del servidor:
Edita `server.properties` antes de hacer el build:
- `max-players=20` → Cambia el número de jugadores
- `difficulty=easy` → Cambia a `normal`, `hard`, etc.
- `gamemode=survival` → Cambia a `creative`, `adventure`, etc.

---

## 🔧 Troubleshooting

### El servidor no inicia:
```bash
docker logs minecraft-server
```

### Reiniciar el servidor:
```bash
docker restart minecraft-server
```

### Eliminar todo y empezar de nuevo:
```bash
docker-compose down -v
docker-compose up -d
```

---

## 📊 Características Incluidas

✅ **Última versión estable** de Minecraft (descarga automática)  
✅ **Modo no premium** (online-mode: false)  
✅ **Optimización de rendimiento** con flags de Aikar  
✅ **Persistencia de datos** con volúmenes de Docker  
✅ **Reinicio automático** si el servidor se cae  
✅ **Fácil de escalar** y configurar  

---

## 🎯 Recomendación

**Para desarrollo/pruebas locales**: Usa `docker-compose up -d`  
**Para producción**: Usa Railway o un VPS con Docker

¡Disfruta tu servidor de Minecraft! 🎮✨
