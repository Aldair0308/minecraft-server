# ⚠️ ERROR: Waystones - Incompatibilidad con Balm

## 🔴 PROBLEMA

```
Waystones has failed to load correctly
java.lang.NullPointerException: Cannot invoke
"net.blay09.mods.balm.api.config.LoadedConfig.getRaw"
```

**Causa**: Versión de Balm incompatible con Waystones

---

## 📊 VERSIONES ACTUALES

- **Balm**: 7.3.37 (muy nueva)
- **Waystones**: 14.1.11 (más vieja)
- **Problema**: Incompatibilidad de versiones

---

## ✅ SOLUCIÓN

Necesitas **actualizar Waystones** a una versión compatible con Balm 7.3.37

### Opción 1: Actualizar Waystones (RECOMENDADO)

**Descargar**:
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/waystones/files/5423913
- **Archivo**: `waystones-forge-1.20.1-14.1.17.jar` (o más reciente)
- **Reemplazar**: El archivo actual en `mods-download\both\`

### Opción 2: Downgrade Balm

**Descargar**:
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/balm/files/5062680
- **Archivo**: `balm-forge-1.20.1-7.3.9.jar`
- **Reemplazar**: El archivo actual en `mods-download\both\`

---

## 🎯 PASOS RÁPIDOS (Opción 1 - Recomendado)

1. **Elimina el Waystones actual**:
   ```powershell
   Remove-Item "mods-download\both\waystones-forge-1.20.1-14.1.11.jar"
   ```

2. **Descarga Waystones actualizado**:
   - Enlace: https://www.curseforge.com/minecraft/mc-mods/waystones/files
   - Busca la versión más reciente para 1.20.1 Forge
   - Descarga (debería ser 14.1.17 o superior)

3. **Guárdalo en**: `mods-download\both\`

4. **Ejecuta el script**:
   ```powershell
   .\preparar-servidor.ps1
   ```

5. **Comparte el nuevo ZIP** con jugadores

---

## 📝 VERIFICACIÓN

Después de actualizar, los jugadores deberían poder iniciar sin errores.

**Archivo correcto**:
- ✅ `waystones-forge-1.20.1-14.1.17.jar` (o superior)
- ✅ `balm-forge-1.20.1-7.3.37-all.jar` (actual)

---

## ⚠️ IMPORTANTE

**NO uses estas combinaciones**:
- ❌ Waystones 14.1.11 + Balm 7.3.37 (INCOMPATIBLE)
- ❌ Waystones 14.1.5 + Balm 7.3.37 (INCOMPATIBLE)

**SÍ usa estas combinaciones**:
- ✅ Waystones 14.1.17+ + Balm 7.3.37
- ✅ Waystones 14.1.11 + Balm 7.3.9

---

## 🔄 DESPUÉS DE ARREGLAR

1. Regenera el modpack:
   ```powershell
   .\preparar-servidor.ps1
   ```

2. Nuevo ZIP se creará

3. Comparte con jugadores

4. Actualiza el servidor:
   ```bash
   git add .
   git commit -m "Fix: Update Waystones for Balm compatibility"
   git push
   ```

---

**Estado**: ⚠️ URGENTE - Incompatibilidad detectada  
**Acción**: Actualizar Waystones a 14.1.17 o superior  
**Tiempo**: 2 minutos
