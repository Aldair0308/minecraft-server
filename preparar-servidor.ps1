# Script final para organizar mods y preparar todo para deploy

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "ORGANIZANDO MODS Y PREPARANDO DEPLOY" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Paso 1: Mover CTOV a la carpeta correcta
Write-Host "Paso 1: Organizando archivos..." -ForegroundColor Yellow

if (Test-Path "mods-download\both\*ctov*.jar") {
    Write-Host "  Moviendo CTOV de 'both' a 'server'..." -ForegroundColor Cyan
    Move-Item "mods-download\both\*ctov*.jar" -Destination "mods-download\server\" -Force
    Write-Host "  OK: CTOV movido a carpeta correcta" -ForegroundColor Green
}

Write-Host ""

# Paso 2: Verificar mods actuales
Write-Host "Paso 2: Verificando mods descargados..." -ForegroundColor Yellow
Write-Host ""

$bothMods = Get-ChildItem "mods-download\both" -Filter *.jar -ErrorAction SilentlyContinue
$serverMods = Get-ChildItem "mods-download\server" -Filter *.jar -ErrorAction SilentlyContinue
$clientMods = Get-ChildItem "mods-download\client" -Filter *.jar -ErrorAction SilentlyContinue

Write-Host "BOTH (Servidor + Cliente):" -ForegroundColor Cyan
$bothMods | ForEach-Object { Write-Host "  OK $_" -ForegroundColor Green }
Write-Host "  Total: $($bothMods.Count) / 8" -ForegroundColor White
Write-Host ""

Write-Host "SERVER (Solo Servidor):" -ForegroundColor Cyan
$serverMods | ForEach-Object { Write-Host "  OK $_" -ForegroundColor Green }
Write-Host "  Total: $($serverMods.Count) / 4" -ForegroundColor White
Write-Host ""

Write-Host "CLIENT (Solo Cliente):" -ForegroundColor Cyan
$clientMods | ForEach-Object { Write-Host "  OK $_" -ForegroundColor Green }
Write-Host "  Total: $($clientMods.Count) / 4" -ForegroundColor White
Write-Host ""

$totalMods = $bothMods.Count + $serverMods.Count + $clientMods.Count
Write-Host "TOTAL: $totalMods / 16 mods" -ForegroundColor $(if ($totalMods -eq 16) { "Green" } else { "Yellow" })
Write-Host ""

if ($totalMods -lt 16) {
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "FALTAN MODS POR DESCARGAR" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Todavia faltan $($16 - $totalMods) mods." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Consulta MODS_INCORRECTOS.md para los enlaces exactos" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "NO PUEDO CONTINUAR hasta que tengas los 16 mods" -ForegroundColor Red
    exit 1
}

# Paso 3: Preparar carpeta server-mods
Write-Host "========================================" -ForegroundColor Green
Write-Host "TODOS LOS MODS DESCARGADOS!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

Write-Host "Paso 3: Preparando mods para el servidor..." -ForegroundColor Yellow

if (!(Test-Path "server-mods")) {
    New-Item -ItemType Directory -Path "server-mods" | Out-Null
}

# Limpiar carpeta
Remove-Item "server-mods\*" -Force -ErrorAction SilentlyContinue

# Copiar mods del servidor (both + server)
Write-Host "  Copiando mods del servidor..." -ForegroundColor Cyan
Copy-Item "mods-download\both\*.jar" -Destination "server-mods\" -Force
Copy-Item "mods-download\server\*.jar" -Destination "server-mods\" -Force

$serverModsCount = (Get-ChildItem "server-mods" -Filter *.jar | Measure-Object).Count
Write-Host "  OK: $serverModsCount mods copiados para el servidor" -ForegroundColor Green
Write-Host ""

# Paso 4: Preparar modpack del cliente
Write-Host "Paso 4: Preparando modpack del cliente..." -ForegroundColor Yellow

# Limpiar carpeta de mods del cliente
if (Test-Path "modpack-cliente\mods\*") {
    Remove-Item "modpack-cliente\mods\*" -Force
}

# Copiar mods del cliente (both + client)
Write-Host "  Copiando mods del cliente..." -ForegroundColor Cyan
Copy-Item "mods-download\both\*.jar" -Destination "modpack-cliente\mods\" -Force
Copy-Item "mods-download\client\*.jar" -Destination "modpack-cliente\mods\" -Force

$clientModsCount = (Get-ChildItem "modpack-cliente\mods" -Filter *.jar | Measure-Object).Count
Write-Host "  OK: $clientModsCount mods copiados al modpack del cliente" -ForegroundColor Green
Write-Host ""

# Paso 5: Crear lista de mods
Write-Host "Paso 5: Creando lista de mods..." -ForegroundColor Yellow

$modList = "# Lista de Mods del Cliente`n`n"
$modList += "Total de mods: $clientModsCount`n`n"
$modList += "Archivos:`n"

Get-ChildItem "modpack-cliente\mods" -Filter *.jar | ForEach-Object {
    $modList += "  - $($_.Name)`n"
}

$modList | Out-File -FilePath "modpack-cliente\LISTA_MODS.txt" -Encoding UTF8
Write-Host "  OK: Lista de mods creada" -ForegroundColor Green
Write-Host ""

# Paso 6: Comprimir modpack del cliente
Write-Host "Paso 6: Comprimiendo modpack del cliente..." -ForegroundColor Yellow

$zipPath = "modpack-cliente-minecraft-1.20.1.zip"
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Compress-Archive -Path "modpack-cliente\*" -DestinationPath $zipPath -Force
$zipSize = [math]::Round((Get-Item $zipPath).Length / 1MB, 2)
Write-Host "  OK: Modpack comprimido: $zipPath ($zipSize MB)" -ForegroundColor Green
Write-Host ""

# Resumen final
Write-Host "========================================" -ForegroundColor Green
Write-Host "TODO LISTO PARA DEPLOY!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Resumen:" -ForegroundColor Cyan
Write-Host "  - Mods para servidor: $serverModsCount archivos en server-mods\" -ForegroundColor White
Write-Host "  - Mods para cliente: $clientModsCount archivos en modpack-cliente\mods\" -ForegroundColor White
Write-Host "  - Modpack comprimido: $zipPath ($zipSize MB)" -ForegroundColor White
Write-Host ""
Write-Host "Proximos pasos:" -ForegroundColor Yellow
Write-Host "  1. Prueba el modpack en tu PC:" -ForegroundColor White
Write-Host "     - Descomprime $zipPath" -ForegroundColor Gray
Write-Host "     - Instala Forge 1.20.1-47.3.0" -ForegroundColor Gray
Write-Host "     - Copia los mods a .minecraft\mods" -ForegroundColor Gray
Write-Host "     - Inicia Minecraft y verifica que carguen" -ForegroundColor Gray
Write-Host ""
Write-Host "  2. Deploy del servidor:" -ForegroundColor White
Write-Host "     docker-compose build" -ForegroundColor Gray
Write-Host "     docker-compose up -d" -ForegroundColor Gray
Write-Host ""
Write-Host "  3. Comparte el modpack con jugadores:" -ForegroundColor White
Write-Host "     - Sube $zipPath a Google Drive/Dropbox" -ForegroundColor Gray
Write-Host "     - Comparte el enlace" -ForegroundColor Gray
Write-Host ""
