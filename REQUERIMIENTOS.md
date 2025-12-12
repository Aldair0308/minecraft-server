# 📋 Requerimientos del Servidor de Minecraft

## 🎯 Objetivo General
Configurar un servidor de Minecraft completo con mods, backups automáticos, permisos de operador y paquetes de mods tanto para el servidor como para los clientes.

---

## 1️⃣ Configuración de Backups Automáticos

### ✅ Estado Actual
- ❌ Backups configurados cada 5 minutos
- ✅ Sistema de backups implementado en `backup.sh`

### 🎯 Requerimiento
- **Cambiar frecuencia de backups a 25 minutos**
- Mantener el sistema de rotación de backups existente
- Conservar los últimos backups (ajustar cantidad según necesidad)

### 📝 Archivos a Modificar
- `backup.sh` - Cambiar el intervalo de `sleep 300` (5 min) a `sleep 1500` (25 min)

---

## 2️⃣ Permisos y Configuración de Jugadores

### 🎯 Requerimientos
1. **Dar OP al jugador Radial51**
   - ✅ Ya configurado en `start.sh` (líneas 36-46)
   - Nivel de operador: 4 (máximo)

2. **Habilitar trucos para todos los jugadores**
   - Modificar `server.properties` para permitir comandos a todos

### 📝 Archivos a Modificar
- `server.properties`:
  - `function-permission-level=2` → Ajustar según necesidad
  - `enable-command-block=true` (ya configurado)
  - Considerar agregar configuración adicional para permisos

---

## 3️⃣ Paquetes de Mods (Modpacks)

### 🎯 Objetivo
Crear dos paquetes de mods:
1. **Modpack del Servidor** - Mods que se ejecutan en el servidor
2. **Modpack del Cliente** - Mods que los jugadores deben instalar

### 📦 Lista de Mods Requeridos

#### 🧟 Zombies y Armas
- **Undead Nights Mod**
  - URL: https://www.minecrafteo.com/undead-nights-mod/
  - Tipo: Cliente + Servidor
  - Descripción: Mejora zombies y añade armas

#### 🏛️ Estructuras
- **Epic Structures Villages**
  - URL: https://www.minecraft-france.fr/mod-epic-structures-villages/
  - Tipo: Servidor
  - Descripción: Mejora las aldeas vanilla

- **Dawn of Time Builder Edition**
  - URL: https://www.minecraft-france.fr/mod-dawn-of-time-builder-edition/
  - Tipo: Servidor
  - Descripción: Genera construcciones masivas (egipcias, romanas, etc.)

#### 👾 Mobs
- **Mob Captains (Datapack/Mod)**
  - URL: https://www.minecraft-france.fr/datapack-mod-mob-captains/
  - Tipo: Servidor
  - Descripción: Agrega jefes a zombies, brujas, etc.

#### 🎨 Shaders e Interfaz
- **Luminara Shader**
  - URL: https://www.minecraft-france.fr/luminara-shader/
  - Tipo: Cliente
  - Descripción: Mejora gráficos
  - ⚠️ **NOTA**: Verificar compatibilidad con servidor

- **Immersive UI**
  - URL: https://www.minecraft-france.fr/mod-immersive-ui/
  - Tipo: Cliente
  - Descripción: Mejora la interfaz de usuario

- **Dynamic Lights**
  - URL: https://www.minecrafteo.com/dynamic-lights-mod/
  - Tipo: Cliente + Servidor
  - Descripción: Luz dinámica para antorchas en mano

#### 🔫 Armas
- **Guns Plus Plus**
  - URL: https://www.minecrafteo.com/guns-plus-plus-mod/
  - Tipo: Cliente + Servidor
  - Descripción: Añade armas de fuego modernas

- **Laser Guns**
  - URL: https://minecraftmodsapp.com/minecraft-gun-mods/
  - Tipo: Cliente + Servidor
  - Descripción: Armas láser futuristas

#### ⚙️ Mods Básicos de Optimización
- **Sodium**
  - Tipo: Cliente
  - Descripción: Mejora rendimiento de FPS
  - URL: https://modrinth.com/mod/sodium

- **Loot Beams**
  - Tipo: Cliente + Servidor
  - Descripción: Añade rayos de luz a items en el suelo
  - URL: Buscar en CurseForge/Modrinth

- **JEI (Just Enough Items)**
  - Tipo: Cliente
  - Descripción: Mejora el inventario y muestra recetas
  - URL: https://www.curseforge.com/minecraft/mc-mods/jei

#### 🌳 Mods Adicionales Solicitados
- **Tree Capitator**
  - Tipo: Cliente + Servidor
  - Descripción: Tala árboles completos de un golpe
  - URL: Buscar en CurseForge

- **Backpack Mod**
  - Tipo: Cliente + Servidor
  - Descripción: Añade mochilas para más inventario
  - URL: Buscar en CurseForge

- **Teleporters**
  - Tipo: Cliente + Servidor
  - Descripción: Sistema de teletransporte
  - URL: Buscar en CurseForge

---

## 4️⃣ Estructura de Modpacks

### 📁 Modpack del Servidor
**Ubicación**: `/data/mods/` (dentro del contenedor)

**Mods a incluir**:
- Undead Nights Mod
- Epic Structures Villages
- Dawn of Time Builder Edition
- Mob Captains
- Dynamic Lights (componente servidor)
- Guns Plus Plus (componente servidor)
- Laser Guns (componente servidor)
- Tree Capitator (componente servidor)
- Backpack Mod (componente servidor)
- Teleporters (componente servidor)
- Loot Beams (componente servidor)

### 📦 Modpack del Cliente
**Distribución**: Archivo ZIP para que los jugadores descarguen

**Mods a incluir**:
- Undead Nights Mod
- Luminara Shader
- Immersive UI
- Dynamic Lights
- Guns Plus Plus
- Laser Guns
- Sodium
- Loot Beams
- JEI (Just Enough Items)
- Tree Capitator
- Backpack Mod
- Teleporters

---

## 5️⃣ Requisitos Técnicos

### 🔧 Versión de Minecraft
- **Determinar versión**: Verificar compatibilidad de todos los mods
- Recomendación: Minecraft 1.20.x o 1.19.x (según compatibilidad de mods)

### 🛠️ Loader de Mods
**Opciones**:
1. **Forge** - Más mods disponibles, más pesado
2. **Fabric** - Más ligero, mejor rendimiento
3. **Quilt** - Fork de Fabric con mejoras

**Decisión**: Verificar qué loader soportan la mayoría de los mods listados

### 💾 Requisitos de Memoria
- **Mínimo recomendado**: 4GB RAM
- **Óptimo**: 6-8GB RAM
- Ajustar variables `MEMORY_MIN` y `MEMORY_MAX` en el Dockerfile

---

## 6️⃣ Tareas de Implementación

### ✅ Fase 1: Configuración Básica
- [ ] Modificar frecuencia de backups a 25 minutos
- [ ] Verificar permisos de operador para Radial51
- [ ] Configurar permisos de comandos para todos los jugadores

### ✅ Fase 2: Investigación de Mods
- [ ] Determinar versión de Minecraft compatible con todos los mods
- [ ] Descargar todos los mods listados
- [ ] Verificar dependencias de cada mod
- [ ] Determinar qué loader usar (Forge/Fabric/Quilt)
- [ ] Verificar compatibilidad entre mods

### ✅ Fase 3: Configuración del Servidor
- [ ] Instalar el loader de mods en el servidor
- [ ] Copiar mods del servidor a `/data/mods/`
- [ ] Configurar cada mod según necesidades
- [ ] Probar que el servidor inicie correctamente
- [ ] Verificar que las estructuras y mobs aparezcan

### ✅ Fase 4: Creación del Modpack Cliente
- [ ] Crear carpeta con todos los mods del cliente
- [ ] Incluir instrucciones de instalación
- [ ] Crear archivo README con:
  - Lista de mods incluidos
  - Pasos de instalación
  - Requisitos del sistema
  - Cómo conectarse al servidor
- [ ] Comprimir en archivo ZIP
- [ ] Subir a plataforma de distribución (Google Drive, Dropbox, etc.)

### ✅ Fase 5: Documentación
- [ ] Actualizar README.md con información de mods
- [ ] Crear guía de instalación para jugadores
- [ ] Documentar configuración de cada mod
- [ ] Crear lista de comandos disponibles

### ✅ Fase 6: Pruebas
- [ ] Probar servidor con todos los mods
- [ ] Verificar rendimiento
- [ ] Probar conexión de cliente con modpack
- [ ] Verificar que todos los mods funcionen correctamente
- [ ] Ajustar configuraciones según sea necesario

---

## 7️⃣ Consideraciones Importantes

### ⚠️ Compatibilidad
- No todos los mods pueden ser compatibles entre sí
- Algunos mods pueden requerir versiones específicas de Minecraft
- Los shaders pueden afectar significativamente el rendimiento

### 🔒 Seguridad
- Descargar mods solo de fuentes oficiales:
  - CurseForge
  - Modrinth
  - Sitios oficiales de los desarrolladores

### 📊 Rendimiento
- Más mods = más recursos necesarios
- Considerar limitar algunos mods si el rendimiento es bajo
- Monitorear uso de RAM y CPU

### 🌐 Distribución
- Considerar usar plataformas como:
  - CurseForge (crear modpack público)
  - Modrinth
  - Google Drive (privado)
  - GitHub Releases

---

## 8️⃣ Recursos Adicionales

### 📚 Enlaces Útiles
- **CurseForge**: https://www.curseforge.com/minecraft/mc-mods
- **Modrinth**: https://modrinth.com/mods
- **Forge**: https://files.minecraftforge.net/
- **Fabric**: https://fabricmc.net/
- **Guía de instalación de mods**: https://www.minecraft.net/es-es/article/guide-minecraft-mods

### 🛠️ Herramientas Recomendadas
- **MultiMC/Prism Launcher**: Gestores de instancias de Minecraft
- **CurseForge App**: Para gestionar modpacks
- **ATLauncher**: Alternativa para modpacks

---

## 📝 Notas Finales

### Próximos Pasos
1. Revisar y aprobar esta lista de requerimientos
2. Determinar la versión de Minecraft a usar
3. Comenzar con la Fase 1 de implementación
4. Iterar según resultados de pruebas

### Actualizaciones
Este documento debe actualizarse conforme se vayan completando las tareas y se descubran nuevos requerimientos o incompatibilidades.

---

**Fecha de creación**: 2025-12-11  
**Última actualización**: 2025-12-11  
**Estado**: 📋 Pendiente de implementación
