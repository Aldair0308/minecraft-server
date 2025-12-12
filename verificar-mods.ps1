# Script para limpiar y organizar mods correctamente
# Solo mantiene mods compatibles con Minecraft 1.20.1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Limpiando y Organizando Mods" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Crear carpeta temporal para mods correctos
$correctMods = "mods-correctos"
if (!(Test-Path $correctMods)) {
    New-Item -ItemType Directory -Path $correctMods | Out-Null
}

New-Item -ItemType Directory -Path "$correctMods\both" -Force | Out-Null
New-Item -ItemType Directory -Path "$correctMods\server" -Force | Out-Null
New-Item -ItemType Directory -Path "$correctMods\client" -Force | Out-Null

Write-Host "Analizando archivos descargados..." -ForegroundColor Yellow
Write-Host ""

# MODS CORRECTOS PARA 1.20.1 (both)
$correctBothMods = @(
    "UndeadNights-2.0.2-Forge-mc1.20.1.jar",
    "treeharvester-1.20.1-9.1.jar"
)

# MODS INCORRECTOS (versiones equivocadas)
Write-Host "ARCHIVOS INCORRECTOS ENCONTRADOS:" -ForegroundColor Red
Write-Host ""

# Revisar carpeta both
Get-ChildItem "mods-download\both" -Filter *.jar | ForEach-Object {
    $fileName = $_.Name
    
    # Instalador de Forge (NO es un mod)
    if ($fileName -like "*installer*") {
        Write-Host "  X $fileName" -ForegroundColor Red
        Write-Host "    Razon: Instalador de Forge, no es un mod" -ForegroundColor Gray
        return
    }
    
    # Versiones 1.21.1 (incorrectas)
    if ($fileName -like "*1.21.1*" -or $fileName -like "*1.21*") {
        Write-Host "  X $fileName" -ForegroundColor Red
        Write-Host "    Razon: Version 1.21.x (necesitamos 1.20.1)" -ForegroundColor Gray
        return
    }
    
    # Versiones 1.12.2 (muy antiguas)
    if ($fileName -like "*1.12.2*") {
        Write-Host "  X $fileName" -ForegroundColor Red
        Write-Host "    Razon: Version 1.12.2 (muy antigua)" -ForegroundColor Gray
        return
    }
    
    # Framework (mod removido)
    if ($fileName -like "*framework*") {
        Write-Host "  X $fileName" -ForegroundColor Red
        Write-Host "    Razon: Framework fue removido del modpack" -ForegroundColor Gray
        return
    }
    
    # CTOV en carpeta incorrecta (debe ir en server)
    if ($fileName -like "*ctov*" -or $fileName -like "*CTOV*") {
        Write-Host "  ! $fileName" -ForegroundColor Yellow
        Write-Host "    Razon: CTOV debe ir en carpeta 'server', no 'both'" -ForegroundColor Gray
        return
    }
    
    # Si llegamos aquí, el mod es correcto
    Write-Host "  OK $fileName" -ForegroundColor Green
    Copy-Item $_.FullName -Destination "$correctMods\both\" -Force
}

Write-Host ""

# Revisar carpeta server
Get-ChildItem "mods-download\server" -Filter *.jar | ForEach-Object {
    $fileName = $_.Name
    
    # Versiones 1.21.1 (incorrectas)
    if ($fileName -like "*1.21.1*" -or $fileName -like "*1.21*") {
        Write-Host "  X $fileName" -ForegroundColor Red
        Write-Host "    Razon: Version 1.21.x (necesitamos 1.20.1)" -ForegroundColor Gray
        return
    }
    
    # Si llegamos aquí, el mod es correcto
    Write-Host "  OK $fileName" -ForegroundColor Green
    Copy-Item $_.FullName -Destination "$correctMods\server\" -Force
}

Write-Host ""

# Revisar carpeta client
Get-ChildItem "mods-download\client" -Filter *.jar | ForEach-Object {
    $fileName = $_.Name
    
    # Versiones 1.21.1 (incorrectas)
    if ($fileName -like "*1.21.1*" -or $fileName -like "*1.21*") {
        Write-Host "  X $fileName" -ForegroundColor Red
        Write-Host "    Razon: Version 1.21.x (necesitamos 1.20.1)" -ForegroundColor Gray
        return
    }
    
    # Si llegamos aquí, el mod es correcto
    Write-Host "  OK $fileName" -ForegroundColor Green
    Copy-Item $_.FullName -Destination "$correctMods\client\" -Force
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "RESUMEN" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""

$bothCount = (Get-ChildItem "$correctMods\both" -Filter *.jar -ErrorAction SilentlyContinue | Measure-Object).Count
$serverCount = (Get-ChildItem "$correctMods\server" -Filter *.jar -ErrorAction SilentlyContinue | Measure-Object).Count
$clientCount = (Get-ChildItem "$correctMods\client" -Filter *.jar -ErrorAction SilentlyContinue | Measure-Object).Count

Write-Host "Mods correctos encontrados:" -ForegroundColor Cyan
Write-Host "  - Both: $bothCount / 8 esperados" -ForegroundColor White
Write-Host "  - Server: $serverCount / 4 esperados" -ForegroundColor White
Write-Host "  - Client: $clientCount / 4 esperados" -ForegroundColor White
Write-Host ""

$total = $bothCount + $serverCount + $clientCount
Write-Host "Total: $total / 16 mods" -ForegroundColor $(if ($total -eq 16) { "Green" } else { "Yellow" })
Write-Host ""

if ($total -lt 16) {
    Write-Host "FALTAN MODS POR DESCARGAR" -ForegroundColor Red
    Write-Host ""
    Write-Host "Necesitas descargar las versiones CORRECTAS (1.20.1) de:" -ForegroundColor Yellow
    Write-Host ""
    
    if ($bothCount -lt 8) {
        Write-Host "BOTH (Servidor + Cliente):" -ForegroundColor Yellow
        Write-Host "  - Balm (1.20.1)" -ForegroundColor White
        Write-Host "  - Waystones (1.20.1)" -ForegroundColor White
        Write-Host "  - Sophisticated Backpacks (1.20.1)" -ForegroundColor White
        Write-Host "  - Sophisticated Core (1.20.1)" -ForegroundColor White
        Write-Host "  - JEI (1.20.1)" -ForegroundColor White
        Write-Host "  - Enchanting Plus (1.20.1)" -ForegroundColor White
        Write-Host ""
    }
    
    if ($serverCount -lt 4) {
        Write-Host "SERVER:" -ForegroundColor Yellow
        Write-Host "  - YUNG's Better Villages (1.20.1)" -ForegroundColor White
        Write-Host "  - YUNG's API (1.20.1)" -ForegroundColor White
        Write-Host "  - ChoiceTheorem's Overhauled Village (1.20.1)" -ForegroundColor White
        Write-Host ""
    }
    
    if ($clientCount -lt 4) {
        Write-Host "CLIENT:" -ForegroundColor Yellow
        Write-Host "  - Xaero's Minimap (1.20.1)" -ForegroundColor White
        Write-Host "  - Xaero's World Map (1.20.1)" -ForegroundColor White
        Write-Host "  - Dynamic Lights (1.20.1)" -ForegroundColor White
        Write-Host ""
    }
    
    Write-Host "Consulta DESCARGAR_MODS_MANUAL.md para los enlaces correctos" -ForegroundColor Cyan
}
else {
    Write-Host "PERFECTO! Todos los mods estan listos" -ForegroundColor Green
    Write-Host ""
    Write-Host "Los mods correctos estan en la carpeta: mods-correctos\" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Proximos pasos:" -ForegroundColor Yellow
    Write-Host "  1. Ejecuta: .\preparar-servidor.ps1" -ForegroundColor White
    Write-Host "  2. Prueba el modpack en tu PC" -ForegroundColor White
    Write-Host "  3. Haz commit y deploy del servidor" -ForegroundColor White
}

Write-Host ""
