# 📥 MODS PARA EL SERVIDOR - Enlaces Directos

## ⚠️ PROBLEMA
El servidor NO tiene los mods cargados. Necesitas subirlos manualmente a Railway.

---

## 📦 MODS DEL SERVIDOR (15 archivos)

### BOTH - Servidor + Cliente (10 mods)

#### 1. Undead Nights
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/undead-nights/files/5746969
- **Archivo**: `UndeadNights-2.0.2-Forge-mc1.20.1.jar`

#### 2. Waystones
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/waystones/files/5423913
- **Archivo**: `waystones-forge-1.20.1-14.1.17.jar`
- ⚠️ **IMPORTANTE**: Descarga versión 14.1.17, NO 14.1.11

#### 3. Balm
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/balm/files/5423914
- **Archivo**: `balm-forge-1.20.1-7.3.37-all.jar`

#### 4. Sophisticated Backpacks
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/sophisticated-backpacks/files/5423878
- **Archivo**: `sophisticatedbackpacks-1.20.1-3.24.13.1433.jar`

#### 5. Sophisticated Core
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/sophisticated-core/files/5423876
- **Archivo**: `sophisticatedcore-1.20.1-1.2.109.1271.jar`

#### 6. JEI
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/jei/files/5405159
- **Archivo**: `jei-1.20.1-forge-15.20.0.127.jar`

#### 7. Tree Harvester
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/tree-harvester/files/5062682
- **Archivo**: `treeharvester-1.20.1-9.1.jar`

#### 8. Enchanting Infuser
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/enchanting-infuser/files/5315890
- **Archivo**: `EnchantingInfuser-v8.0.3-1.20.1-Forge.jar`

#### 9. Collective
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/collective/files/5062681
- **Archivo**: `collective-1.20.1-8.13.jar`

#### 10. Puzzleslib
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/puzzles-lib/files/5315889
- **Archivo**: `PuzzlesLib-v8.1.33-1.20.1-Forge.jar`

---

### SERVER - Solo Servidor (5 mods)

#### 11. Better Village
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/better-village-forge/files/5174733
- **Archivo**: `bettervillage-forge-1.20.1-3.3.1-all.jar`

#### 12. YUNG's API
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/yungs-api/files/5423920
- **Archivo**: `YungsApi-1.20-Forge-4.0.6.jar`

#### 13. ChoiceTheorem's Overhauled Village
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/choicetheorems-overhauled-village/files/5490044
- **Archivo**: `ctov-3.4.6.jar`

#### 14. When Dungeons Arise
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/when-dungeons-arise/files/4826311
- **Archivo**: `DungeonsArise-1.20.1-2.1.56.1-beta.jar`

#### 15. Architectury API (Dependencia de When Dungeons Arise)
- **Enlace**: https://www.curseforge.com/minecraft/mc-mods/architectury-api/files/5187722
- **Archivo**: `architectury-9.2.14-forge.jar`
- ⚠️ **IMPORTANTE**: Esta dependencia faltaba!

---

## 🚀 CÓMO SUBIR A RAILWAY

### Opción 1: Usar el Dockerfile (RECOMENDADO)

1. **Descarga todos los mods** (15 archivos)
2. **Cópialos a** `server-mods/`
3. **Commit y push**:
   ```bash
   git add server-mods/
   git commit -m "Add all server mods"
   git push
   ```

### Opción 2: Subir Manualmente via Railway Shell

1. **Descarga todos los mods** (15 archivos)
2. En Railway → Service → Shell
3. Ejecuta:
   ```bash
   mkdir -p /tmp/minecraft/mods
   ```
4. Sube cada archivo usando Railway CLI o interfaz web

---

## 📋 CHECKLIST DE DESCARGA

### BOTH (10 mods)
- [ ] Undead Nights
- [ ] Waystones (v14.1.17)
- [ ] Balm
- [ ] Sophisticated Backpacks
- [ ] Sophisticated Core
- [ ] JEI
- [ ] Tree Harvester
- [ ] Enchanting Infuser
- [ ] Collective
- [ ] Puzzleslib

### SERVER (5 mods)
- [ ] Better Village
- [ ] YUNG's API
- [ ] ChoiceTheorem's Overhauled Village
- [ ] When Dungeons Arise
- [ ] Architectury API ⭐ NUEVO

---

## ⚠️ IMPORTANTE

### Waystones
- ✅ Descarga versión **14.1.17**
- ❌ NO uses versión 14.1.11 (incompatible con Balm)

### Architectury API
- ⚠️ **FALTABA** esta dependencia
- Es requerida por When Dungeons Arise
- Sin ella, el servidor no iniciará

---

## 🎯 PASOS RÁPIDOS

1. **Descarga los 15 mods** usando los enlaces de arriba

2. **Verifica que tienes**:
   - 10 archivos para BOTH
   - 5 archivos para SERVER
   - Total: 15 archivos .jar

3. **Cópialos a** `server-mods/`:
   ```powershell
   # Desde mods-download
   Copy-Item mods-download\both\*.jar server-mods\
   Copy-Item mods-download\server\*.jar server-mods\
   ```

4. **Verifica**:
   ```powershell
   Get-ChildItem server-mods\*.jar | Measure-Object
   # Debe mostrar: Count = 15
   ```

5. **Commit y Push**:
   ```bash
   git add server-mods/
   git commit -m "Add all 15 server mods"
   git push
   ```

---

## 📊 VERIFICACIÓN

Después del deploy, en los logs deberías ver:
```
📦 Mods: 15 mods cargados
```

---

**Total**: 15 mods  
**Faltaba**: Architectury API (dependencia)  
**Siguiente paso**: Descargar y copiar a `server-mods/`
