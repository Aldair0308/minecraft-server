# Script para limpiar archivos incorrectos automaticamente

Write-Host "========================================" -ForegroundColor Red
Write-Host "LIMPIANDO ARCHIVOS INCORRECTOS" -ForegroundColor Red
Write-Host "========================================" -ForegroundColor Red
Write-Host ""

$eliminados = 0

Write-Host "Eliminando archivos incorrectos..." -ForegroundColor Yellow
Write-Host ""

# Carpeta both
Write-Host "Carpeta: mods-download\both" -ForegroundColor Cyan

Get-ChildItem "mods-download\both" -Filter *.jar | ForEach-Object {
    $fileName = $_.Name
    $eliminar = $false
    $razon = ""
    
    # Instalador de Forge
    if ($fileName -like "*installer*") {
        $eliminar = $true
        $razon = "Instalador de Forge"
    }
    # Versiones 1.21.x
    elseif ($fileName -like "*1.21.1*" -or $fileName -like "*1.21*") {
        $eliminar = $true
        $razon = "Version 1.21.x"
    }
    # Versiones 1.12.2
    elseif ($fileName -like "*1.12.2*") {
        $eliminar = $true
        $razon = "Version 1.12.2"
    }
    # Framework (removido)
    elseif ($fileName -like "*framework*") {
        $eliminar = $true
        $razon = "Mod removido del pack"
    }
    # CTOV en carpeta incorrecta
    elseif ($fileName -like "*ctov*" -or $fileName -like "*CTOV*") {
        $eliminar = $true
        $razon = "Debe ir en carpeta server"
    }
    
    if ($eliminar) {
        Write-Host "  X $fileName" -ForegroundColor Red
        Write-Host "    Razon: $razon" -ForegroundColor Gray
        Remove-Item $_.FullName -Force
        $eliminados++
    }
}

Write-Host ""

# Carpeta server
Write-Host "Carpeta: mods-download\server" -ForegroundColor Cyan

Get-ChildItem "mods-download\server" -Filter *.jar | ForEach-Object {
    $fileName = $_.Name
    $eliminar = $false
    $razon = ""
    
    # Versiones 1.21.x
    if ($fileName -like "*1.21.1*" -or $fileName -like "*1.21*") {
        $eliminar = $true
        $razon = "Version 1.21.x"
    }
    
    if ($eliminar) {
        Write-Host "  X $fileName" -ForegroundColor Red
        Write-Host "    Razon: $razon" -ForegroundColor Gray
        Remove-Item $_.FullName -Force
        $eliminados++
    }
}

Write-Host ""

# Carpeta client
Write-Host "Carpeta: mods-download\client" -ForegroundColor Cyan

Get-ChildItem "mods-download\client" -Filter *.jar | ForEach-Object {
    $fileName = $_.Name
    $eliminar = $false
    $razon = ""
    
    # Versiones 1.21.x
    if ($fileName -like "*1.21.1*" -or $fileName -like "*1.21*") {
        $eliminar = $true
        $razon = "Version 1.21.x"
    }
    
    if ($eliminar) {
        Write-Host "  X $fileName" -ForegroundColor Red
        Write-Host "    Razon: $razon" -ForegroundColor Gray
        Remove-Item $_.FullName -Force
        $eliminados++
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "LIMPIEZA COMPLETADA" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Archivos eliminados: $eliminados" -ForegroundColor Yellow
Write-Host ""
Write-Host "Ahora descarga los mods correctos (1.20.1)" -ForegroundColor Cyan
Write-Host "Consulta: MODS_INCORRECTOS.md" -ForegroundColor Cyan
Write-Host ""
