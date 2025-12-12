# ⚠️ DEPENDENCIAS FALTANTES - DESCARGAR URGENTE

## 🔴 PROBLEMA
Los jugadores no pueden iniciar el modpack porque faltan 2 dependencias:

1. **Collective** (requerido por Tree Harvester)
2. **Puzzleslib** (requerido por Enchanting Infuser)

---

## 📥 DESCARGAR AHORA

### 1. Collective
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/collective/files/5062681
- **Archivo**: `collective-1.20.1-7.87.jar`
- **Guardar en**: `mods-download\both\`

### 2. Puzzleslib
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/puzzles-lib/files/5315889
- **Archivo**: `PuzzlesLib-v8.1.33-1.20.1-Forge.jar`
- **Guardar en**: `mods-download\both\`

---

## 🎯 PASOS RÁPIDOS

1. **Descarga los 2 archivos** usando los enlaces de arriba

2. **Guárdalos en**: `mods-download\both\`

3. **Ejecuta el script**:
   ```powershell
   .\preparar-servidor.ps1
   ```

4. **Nuevo ZIP se creará** con las dependencias incluidas

5. **Comparte el nuevo ZIP** con los jugadores

---

## 📊 NUEVO TOTAL DE MODS

**Antes**: 16 mods  
**Ahora**: 18 mods (16 + 2 dependencias)

### BOTH - Servidor + Cliente (10)
1. Undead Nights
2. Waystones
3. Balm
4. Sophisticated Backpacks
5. Sophisticated Core
6. JEI
7. Tree Harvester
8. Enchanting Infuser
9. **Collective** ⭐ NUEVO
10. **Puzzleslib** ⭐ NUEVO

### SERVER - Solo Servidor (4)
11. Better Village
12. YUNG's API
13. ChoiceTheorem's Overhauled Village
14. When Dungeons Arise

### CLIENT - Solo Cliente (4)
15. Embeddium
16. Dynamic Lights
17. Xaero's Minimap
18. Xaero's World Map

---

## ⚠️ IMPORTANTE

**SIN estas dependencias**:
- ❌ Tree Harvester no funciona
- ❌ Enchanting Infuser no funciona
- ❌ Jugadores ven error al iniciar

**CON estas dependencias**:
- ✅ Todos los mods funcionan
- ✅ No hay errores
- ✅ Jugadores pueden jugar

---

## 🔄 DESPUÉS DE DESCARGAR

1. Ejecuta: `.\preparar-servidor.ps1`
2. Se creará nuevo ZIP: `modpack-cliente-minecraft-1.20.1.zip`
3. Comparte el nuevo ZIP con jugadores
4. También actualiza el servidor:
   ```powershell
   git add .
   git commit -m "Add: Collective y Puzzleslib dependencies"
   git push
   ```

---

**Estado**: ⚠️ URGENTE - Faltan 2 dependencias  
**Acción**: Descargar Collective y Puzzleslib AHORA  
**Tiempo**: 2 minutos
