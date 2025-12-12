# 📦 Guía de Implementación de Modpacks

## 🎯 Objetivo
Esta guía te ayudará a implementar los modpacks para el servidor y los clientes paso a paso.

---

## 📋 Paso 1: Determinar la Versión de Minecraft

### ✅ Acción Requerida
1. Visitar cada enlace de mod proporcionado
2. Verificar qué versión de Minecraft soporta cada mod
3. Encontrar la versión común más reciente

### 📝 Tabla de Compatibilidad (A completar)

| Mod | Versión Mínima | Versión Máxima | Loader Requerido |
|-----|----------------|----------------|------------------|
| Undead Nights | ? | ? | Forge/Fabric |
| Epic Structures Villages | ? | ? | ? |
| Dawn of Time Builder | ? | ? | ? |
| Mob Captains | ? | ? | ? |
| Luminara Shader | ? | ? | ? |
| Immersive UI | ? | ? | ? |
| Dynamic Lights | ? | ? | ? |
| Guns Plus Plus | ? | ? | ? |
| Laser Guns | ? | ? | ? |
| Sodium | 1.16+ | Latest | Fabric |
| Loot Beams | ? | ? | ? |
| JEI | 1.12+ | Latest | Forge/Fabric |
| Tree Capitator | ? | ? | ? |
| Backpack Mod | ? | ? | ? |
| Teleporters | ? | ? | ? |

**Versión Recomendada**: _[A determinar después de investigación]_

---

## 📋 Paso 2: Descargar los Mods

### 🔍 Fuentes Oficiales
- **CurseForge**: https://www.curseforge.com/minecraft/mc-mods
- **Modrinth**: https://modrinth.com/mods
- **Sitios oficiales**: Usar los enlaces proporcionados

### 📁 Estructura de Carpetas Recomendada
```
minecraft-server/
├── mods-download/
│   ├── server/          # Mods solo para servidor
│   ├── client/          # Mods solo para cliente
│   └── both/            # Mods para ambos
└── modpack-client/      # Carpeta para distribuir a jugadores
    ├── mods/
    ├── config/
    └── README.md
```

### ✅ Lista de Descarga

#### Mods del Servidor (server/ y both/)
- [ ] Undead Nights Mod
- [ ] Epic Structures Villages
- [ ] Dawn of Time Builder Edition
- [ ] Mob Captains
- [ ] Dynamic Lights
- [ ] Guns Plus Plus
- [ ] Laser Guns
- [ ] Tree Capitator
- [ ] Backpack Mod
- [ ] Teleporters
- [ ] Loot Beams

#### Mods del Cliente (client/ y both/)
- [ ] Undead Nights Mod
- [ ] Luminara Shader
- [ ] Immersive UI
- [ ] Dynamic Lights
- [ ] Guns Plus Plus
- [ ] Laser Guns
- [ ] Sodium
- [ ] Loot Beams
- [ ] JEI (Just Enough Items)
- [ ] Tree Capitator
- [ ] Backpack Mod
- [ ] Teleporters

---

## 📋 Paso 3: Configurar el Servidor con Forge/Fabric

### Opción A: Usar Forge

#### 1. Modificar el Dockerfile
```dockerfile
# Agregar después de la línea de descarga del servidor
RUN wget -O forge-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/[VERSION]/forge-[VERSION]-installer.jar && \
    java -jar forge-installer.jar --installServer && \
    rm forge-installer.jar
```

#### 2. Modificar start.sh
Cambiar la línea de inicio del servidor para usar Forge:
```bash
exec java -Xms${MEMORY_MIN} -Xmx${MEMORY_MAX} \
    ... (flags existentes) ...
    -jar forge-[VERSION].jar --nogui
```

### Opción B: Usar Fabric

#### 1. Modificar el Dockerfile
```dockerfile
# Agregar después de la línea de descarga del servidor
RUN wget -O fabric-installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/[VERSION]/fabric-installer-[VERSION].jar && \
    java -jar fabric-installer.jar server -mcversion [MC_VERSION] -downloadMinecraft && \
    rm fabric-installer.jar
```

#### 2. Modificar start.sh
Cambiar la línea de inicio del servidor para usar Fabric:
```bash
exec java -Xms${MEMORY_MIN} -Xmx${MEMORY_MAX} \
    ... (flags existentes) ...
    -jar fabric-server-launch.jar --nogui
```

---

## 📋 Paso 4: Instalar Mods en el Servidor

### 1. Crear carpeta de mods
```bash
mkdir -p /data/mods
```

### 2. Copiar mods al servidor
Agregar en el Dockerfile:
```dockerfile
# Copiar mods del servidor
COPY mods-download/server/*.jar /data/mods/
COPY mods-download/both/*.jar /data/mods/
```

### 3. Configurar permisos
```bash
chmod 644 /data/mods/*.jar
```

---

## 📋 Paso 5: Crear Modpack para Clientes

### 1. Estructura del Modpack
```
modpack-cliente-minecraft/
├── mods/
│   ├── [todos los mods del cliente].jar
│   └── ...
├── config/
│   └── [archivos de configuración si son necesarios]
├── README.md
└── INSTRUCCIONES_INSTALACION.md
```

### 2. Crear README.md para el Modpack
```markdown
# 🎮 Modpack del Servidor de Minecraft

## 📋 Mods Incluidos
- Undead Nights - Zombies mejorados y armas
- Luminara Shader - Gráficos mejorados
- Immersive UI - Interfaz mejorada
- Dynamic Lights - Luz dinámica
- Guns Plus Plus - Armas modernas
- Laser Guns - Armas láser
- Sodium - Optimización de FPS
- Loot Beams - Rayos de luz en items
- JEI - Inventario mejorado
- Tree Capitator - Tala rápida de árboles
- Backpack Mod - Mochilas
- Teleporters - Sistema de teletransporte

## 💻 Requisitos
- Minecraft Java Edition [VERSIÓN]
- [Forge/Fabric] [VERSIÓN]
- 4GB RAM mínimo
- Java 17 o superior

## 📥 Instalación
Ver INSTRUCCIONES_INSTALACION.md
```

### 3. Crear INSTRUCCIONES_INSTALACION.md
```markdown
# 📥 Instrucciones de Instalación

## Método 1: Instalación Manual

### Paso 1: Instalar Minecraft Launcher
1. Descarga el launcher oficial de Minecraft
2. Inicia sesión con tu cuenta

### Paso 2: Instalar Forge/Fabric
1. Descarga [Forge/Fabric] desde [URL]
2. Ejecuta el instalador
3. Selecciona "Install Client"
4. Espera a que termine la instalación

### Paso 3: Instalar los Mods
1. Abre el launcher de Minecraft
2. Ve a "Installations"
3. Haz clic en la carpeta junto a la instalación de Forge/Fabric
4. Abre la carpeta "mods"
5. Copia todos los archivos .jar de la carpeta "mods" de este modpack
6. Pega los archivos en la carpeta "mods" de Minecraft

### Paso 4: Configurar (Opcional)
1. Si hay archivos en la carpeta "config" del modpack
2. Cópialos a la carpeta "config" de Minecraft

### Paso 5: Conectarse al Servidor
1. Inicia Minecraft con el perfil de Forge/Fabric
2. Ve a "Multiplayer"
3. Añade el servidor con la IP: [TU_IP_SERVIDOR]
4. ¡Juega!

## Método 2: Usar un Launcher de Modpacks

### Opción A: CurseForge App
1. Descarga CurseForge App
2. Importa el modpack (si está publicado)
3. Inicia el juego

### Opción B: MultiMC/Prism Launcher
1. Descarga Prism Launcher
2. Crea una nueva instancia
3. Importa los mods manualmente
4. Inicia el juego

## ⚠️ Solución de Problemas

### El juego no inicia
- Verifica que tienes Java 17 o superior
- Asigna más RAM al juego (4GB mínimo)
- Verifica que todos los mods sean compatibles con la versión

### Crashes al conectar al servidor
- Asegúrate de tener TODOS los mods instalados
- Verifica que las versiones coincidan con el servidor

### Bajo rendimiento
- Desactiva los shaders temporalmente
- Reduce la distancia de renderizado
- Cierra otros programas
```

---

## 📋 Paso 6: Distribuir el Modpack

### Opciones de Distribución

#### Opción 1: Google Drive / Dropbox
1. Comprimir la carpeta del modpack en ZIP
2. Subir a Google Drive o Dropbox
3. Compartir el enlace con los jugadores

#### Opción 2: GitHub Releases
1. Crear un repositorio en GitHub
2. Crear un Release
3. Subir el ZIP como asset
4. Compartir el enlace

#### Opción 3: CurseForge (Público)
1. Crear cuenta en CurseForge
2. Crear un nuevo modpack
3. Subir los archivos
4. Publicar

---

## 📋 Paso 7: Configuración Adicional del Servidor

### Ajustar server.properties
```properties
# Habilitar comandos para todos
function-permission-level=2

# Permitir vuelo (algunos mods lo requieren)
allow-flight=true

# Aumentar distancia de vista si el servidor lo soporta
view-distance=12

# Aumentar jugadores si es necesario
max-players=30
```

### Configurar permisos de mods
Algunos mods pueden requerir configuración adicional en sus archivos de config.

---

## 📋 Paso 8: Pruebas

### Checklist de Pruebas
- [ ] El servidor inicia correctamente con todos los mods
- [ ] No hay errores críticos en los logs
- [ ] Las estructuras nuevas generan correctamente
- [ ] Los mobs nuevos aparecen
- [ ] Las armas funcionan
- [ ] Los comandos funcionan
- [ ] El cliente puede conectarse con el modpack
- [ ] No hay lag excesivo
- [ ] Los backups funcionan correctamente
- [ ] El jugador Radial51 tiene permisos de OP

---

## 🔧 Comandos Útiles

### Dar OP a un jugador
```
/op Radial51
```

### Verificar mods cargados
```
/forge mods
# o
/fabric mods
```

### Recargar configuración
```
/reload
```

### Ver TPS (rendimiento)
```
/forge tps
```

---

## 📝 Notas Importantes

### Compatibilidad
- No todos los mods pueden funcionar juntos
- Algunos mods pueden requerir dependencias adicionales
- Verifica siempre los logs para errores

### Rendimiento
- Más mods = más recursos necesarios
- Considera aumentar la RAM del servidor si hay lag
- Algunos mods pueden ser más pesados que otros

### Actualizaciones
- Mantén los mods actualizados
- Verifica compatibilidad antes de actualizar
- Haz backups antes de actualizar

---

## 🆘 Recursos de Ayuda

### Documentación
- Forge: https://docs.minecraftforge.net/
- Fabric: https://fabricmc.net/wiki/
- CurseForge: https://support.curseforge.com/

### Comunidades
- r/feedthebeast (Reddit)
- Discord de Forge/Fabric
- Foros de Minecraft

---

**Última actualización**: 2025-12-11  
**Estado**: 📋 Guía de implementación
