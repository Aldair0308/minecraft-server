# Script para descargar mods de Minecraft 1.20.1 Forge
# Version del servidor: 1.20.1
# Loader: Forge

Write-Host "Descargando mods para Minecraft 1.20.1 Forge..." -ForegroundColor Green
Write-Host ""

# Funcion para descargar archivos
function Download-Mod {
    param(
        [string]$Url,
        [string]$OutputPath,
        [string]$ModName
    )
    
    Write-Host "Descargando: $ModName" -ForegroundColor Cyan
    try {
        Invoke-WebRequest -Uri $Url -OutFile $OutputPath -UserAgent "Mozilla/5.0"
        Write-Host "OK: $ModName descargado" -ForegroundColor Green
    }
    catch {
        Write-Host "ERROR descargando $ModName : $_" -ForegroundColor Red
    }
    Write-Host ""
}

# Crear directorios si no existen
$dirs = @(
    "mods-download\server",
    "mods-download\client",
    "mods-download\both"
)

foreach ($dir in $dirs) {
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
}

Write-Host "MODS PARA SERVIDOR Y CLIENTE (both)" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow

# 1. Undead Nights - Zombies mejorados
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5746/969/UndeadNights-1.20.1-2.0.2.jar" -OutputPath "mods-download\both\UndeadNights-1.20.1-2.0.2.jar" -ModName "Undead Nights (Zombies)"

# 2. Waystones - Teletransporte
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5423/913/waystones-forge-1.20.1-14.1.5.jar" -OutputPath "mods-download\both\waystones-forge-1.20.1-14.1.5.jar" -ModName "Waystones (Teleport)"

# 3. Sophisticated Backpacks - Mochilas
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5423/878/sophisticatedbackpacks-1.20.1-3.20.17.1150.jar" -OutputPath "mods-download\both\sophisticatedbackpacks-1.20.1-3.20.17.1150.jar" -ModName "Sophisticated Backpacks"

# 4. Sophisticated Core - Dependencia de Backpacks
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5423/876/sophisticatedcore-1.20.1-1.0.3.799.jar" -OutputPath "mods-download\both\sophisticatedcore-1.20.1-1.0.3.799.jar" -ModName "Sophisticated Core (Dependencia)"

# 5. Balm - Dependencia de Waystones
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5423/914/balm-forge-1.20.1-7.3.9.jar" -OutputPath "mods-download\both\balm-forge-1.20.1-7.3.9.jar" -ModName "Balm (Dependencia)"

# 6. JEI - Just Enough Items (recetas)
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5405/159/jei-1.20.1-forge-15.20.0.104.jar" -OutputPath "mods-download\both\jei-1.20.1-forge-15.20.0.104.jar" -ModName "JEI (Just Enough Items)"

# 7. Tree Harvester - Tala de arboles
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5062/682/treeharvester-1.20.1-9.1.jar" -OutputPath "mods-download\both\treeharvester-1.20.1-9.1.jar" -ModName "Tree Harvester"

# 8. Enchanting Infuser - Encantamientos mejorados
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5315/890/enchanting_infuser-1.20.1-8.0.3.jar" -OutputPath "mods-download\both\enchanting_infuser-1.20.1-8.0.3.jar" -ModName "Enchanting Infuser"

# NOTA: Los siguientes mods fueron removidos por no tener version estable para 1.20.1:
# - MrCrayfish's Gun Mod + Framework
# - Loot Beams
# - Enchanting Plus (reemplazado por Enchanting Infuser)

Write-Host ""
Write-Host "MODS SOLO PARA SERVIDOR (server)" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow

# 10. Better Village - Aldeas mejoradas
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5174/733/bettervillage-forge-1.20.1-3.2.0-all.jar" -OutputPath "mods-download\server\bettervillage-forge-1.20.1-3.2.0-all.jar" -ModName "Better Village"

# 11. YUNG's API - Dependencia (opcional)
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5423/920/YungsApi-1.20-Forge-4.0.6.jar" -OutputPath "mods-download\server\YungsApi-1.20-Forge-4.0.6.jar" -ModName "YUNG's API (Opcional)"

# 12. ChoiceTheorem's Overhauled Village - Aldeas epicas
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5490/044/ctov-3.4.6.jar" -OutputPath "mods-download\server\ctov-3.4.6.jar" -ModName "ChoiceTheorem's Overhauled Village"

# 13. When Dungeons Arise - Estructuras masivas
Download-Mod -Url "https://mediafilez.forgecdn.net/files/4826/311/WhenDungeonsArise-2.1.5c-forge.jar" -OutputPath "mods-download\server\WhenDungeonsArise-2.1.5c.jar" -ModName "When Dungeons Arise"

Write-Host ""
Write-Host "MODS SOLO PARA CLIENTE (client)" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow

# 13. Embeddium - Optimizacion (alternativa a Sodium para Forge)
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5423/924/embeddium-0.3.31+mc1.20.1.jar" -OutputPath "mods-download\client\embeddium-0.3.31+mc1.20.1.jar" -ModName "Embeddium (Optimizacion FPS)"

# 14. Dynamic Lights - Luz dinamica
Download-Mod -Url "https://mediafilez.forgecdn.net/files/4699/749/dynamiclights-1.20.1.jar" -OutputPath "mods-download\client\dynamiclights-1.20.1.jar" -ModName "Dynamic Lights"

# 15. Xaero's Minimap - Minimapa
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5423/927/Xaeros_Minimap_24.6.0_Forge_1.20.jar" -OutputPath "mods-download\client\Xaeros_Minimap_24.6.0_Forge_1.20.jar" -ModName "Xaero's Minimap"

# 16. Xaero's World Map - Mapa del mundo
Download-Mod -Url "https://mediafilez.forgecdn.net/files/5423/928/XaerosWorldMap_1.39.2_Forge_1.20.jar" -OutputPath "mods-download\client\XaerosWorldMap_1.39.2_Forge_1.20.jar" -ModName "Xaero's World Map"

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Descarga de mods completada!" -ForegroundColor Green
Write-Host ""
Write-Host "Resumen:" -ForegroundColor Cyan
Write-Host "   - Mods servidor+cliente (both): $((Get-ChildItem 'mods-download\both' -Filter *.jar -ErrorAction SilentlyContinue | Measure-Object).Count)" -ForegroundColor White
Write-Host "   - Mods solo servidor: $((Get-ChildItem 'mods-download\server' -Filter *.jar -ErrorAction SilentlyContinue | Measure-Object).Count)" -ForegroundColor White
Write-Host "   - Mods solo cliente: $((Get-ChildItem 'mods-download\client' -Filter *.jar -ErrorAction SilentlyContinue | Measure-Object).Count)" -ForegroundColor White
Write-Host ""
Write-Host "Ubicaciones:" -ForegroundColor Cyan
Write-Host "   - Servidor: mods-download\server y mods-download\both" -ForegroundColor White
Write-Host "   - Cliente: mods-download\client y mods-download\both" -ForegroundColor White
Write-Host ""
