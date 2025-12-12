# 🔴 UNDEAD NIGHTS - MOD INCOMPATIBLE

## ⚠️ ERROR

```
UndeadNights (undeadnights) has failed to load correctly
java.lang.NoSuchMethodException: net.petemc.undeadnights.UndeadNights.<init>()
```

**Causa**: Undead Nights 2.0.2 tiene un error de constructor y no es compatible con Forge 47.3.0

---

## ✅ SOLUCIÓN RÁPIDA

**Quitar Undead Nights del servidor**

### Paso 1: Eliminar del servidor

```powershell
# Elimina Undead Nights de server-mods
Remove-Item server-mods\UndeadNights-2.0.2-Forge-mc1.20.1.jar
```

### Paso 2: Eliminar del modpack del cliente

```powershell
# Elimina Undead Nights del modpack
Remove-Item modpack-cliente\mods\UndeadNights-2.0.2-Forge-mc1.20.1.jar
Remove-Item mods-download\both\UndeadNights-2.0.2-Forge-mc1.20.1.jar
```

### Paso 3: Regenerar modpack

```powershell
.\preparar-servidor.ps1
```

### Paso 4: Commit y Push

```bash
git add .
git commit -m "Remove: Undead Nights (incompatible with Forge)"
git push
```

---

## 📊 MODS FINALES

**Antes**: 17 mods  
**Ahora**: 16 mods (sin Undead Nights)

### BOTH - Servidor + Cliente (9 mods)
1. ~~Undead Nights~~ ❌ REMOVIDO
2. Waystones ✅
3. Balm ✅
4. Sophisticated Backpacks ✅
5. Sophisticated Core ✅
6. JEI ✅
7. Tree Harvester ✅
8. Enchanting Infuser ✅
9. Collective ✅
10. Puzzleslib ✅

### SERVER - Solo Servidor (7 mods)
11. Better Village ✅
12. Library Ferret ✅
13. YUNG's API ✅
14. ChoiceTheorem's Overhauled Village ✅
15. Lithostitched ✅
16. When Dungeons Arise ✅
17. Architectury API ⚠️ (opcional)

---

## 🎮 ALTERNATIVA (Opcional)

Si quieres zombies mejorados, puedes usar:

### The Graveyard
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/the-graveyard-forge/files/5423919
- **Archivo**: `The_Graveyard_3.1_(FORGE)_for_1.20.1.jar`
- **Compatible**: ✅ Forge 1.20.1
- **Descripción**: Cementerios, zombies mejorados, estructuras

O simplemente déjalo sin mod de zombies.

---

## ⚠️ IMPORTANTE

### Sin Undead Nights
- ✅ El servidor funcionará
- ✅ Puedes conectarte
- ✅ Todos los demás mods funcionan
- ❌ No hay zombies mejorados (solo vanilla)

### Con Undead Nights
- ❌ El servidor crashea
- ❌ No puedes conectarte
- ❌ Error de constructor

---

## 🚀 PASOS FINALES

1. **Elimina Undead Nights**:
   ```powershell
   Remove-Item server-mods\UndeadNights*.jar
   Remove-Item modpack-cliente\mods\UndeadNights*.jar
   Remove-Item mods-download\both\UndeadNights*.jar
   ```

2. **Regenera modpack**:
   ```powershell
   .\preparar-servidor.ps1
   ```

3. **Verifica conteo**:
   ```powershell
   Get-ChildItem server-mods\*.jar | Measure-Object
   # Debe mostrar: Count = 16
   ```

4. **Commit y Push**:
   ```bash
   git add .
   git commit -m "Remove Undead Nights - incompatible"
   git push
   ```

---

## ✅ VERIFICACIÓN

Después del deploy, el servidor debería:
- ✅ Iniciar sin errores
- ✅ Cargar 16 mods
- ✅ Mostrar "Done!"
- ✅ Permitir conexiones

---

**Estado**: ⚠️ Undead Nights incompatible  
**Acción**: Eliminar del servidor y modpack  
**Resultado**: 16 mods funcionando  
**Tiempo**: 2 minutos
