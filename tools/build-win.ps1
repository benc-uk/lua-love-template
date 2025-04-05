# PowerShell Script to build a Love2D executable binary for Windows
# Usage: .\build-win.ps1 -srcPath "path\to\your\game" -outputPath "path\to\output\directory" 
# Example: .\build-win.ps1 -srcPath "C:\MyGame" -outputPath "C:\MyGame\build"

param (
    [string]$srcPath,
    [string]$outputPath
)

# Find love.exe in PATH
$lovePath = Get-Command love.exe -ErrorAction SilentlyContinue  
if (-Not $lovePath) {
    Write-Host "love.exe not found in PATH. Please ensure Love2D is installed and added to your PATH."
    exit 1
}
echo "Using love.exe from: $($lovePath.Path)"

# Check if srcPath and outputPath are provided
if (-Not $srcPath -or -Not $outputPath) {
    Write-Host "Usage: .\build-win.ps1 -srcPath 'path\to\your\game' -outputPath 'path\to\output\directory'"
    exit 1
}

# Check if srcPath exists
if (-Not (Test-Path $srcPath)) {
    Write-Host "Game path does not exist: $srcPath"
    exit 1
}

# Check if outputPath exists, if not create it
if (-Not (Test-Path $outputPath)) {
    New-Item -ItemType Directory -Path $outputPath | Out-Null
}

# Compress the game folder into a .zip file
$zipFileName = Join-Path $outputPath "out.love"
$exeFileName = Join-Path $outputPath "out.exe"

echo "Compressing src folder to $zipFileName"
Compress-Archive -Path $srcPath\* -DestinationPath $zipFileName -Force

# Copy love.exe together with the .love file
echo "Building executable $exeFileName"
Get-Content $lovePath.Path,$zipFileName -AsByteStream | Set-Content $exeFileName -AsByteStream -Force
