# Nick Zoc's PowerShell Theme Setup - One-Liner Installer
# This script downloads and runs the full PowerShell theme setup automatically

# Create temp directory for download
$tempDir = "$env:TEMP\NickZocPowerShellSetup"
if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force }
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

Write-Host "Downloading Nick Zoc's PowerShell Theme Setup..." -ForegroundColor Cyan

# Download the repository as ZIP
$zipUrl = "https://github.com/Nick-Zoc/My-Terminal-Setup/archive/refs/heads/main.zip"
$zipPath = "$tempDir\setup.zip"

try {
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
    
    # Extract the ZIP
    Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force
    
    # Navigate to the extracted folder and run setup
    $extractedPath = "$tempDir\My-Terminal-Setup-main"
    Set-Location "$extractedPath\Scripts"
    
    # Run the main setup script
    .\Setup-Terminal.ps1
    
    # Cleanup
    Set-Location $env:USERPROFILE
    Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
    
}
catch {
    Write-Host "Error downloading or running setup: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Please try downloading manually from: https://github.com/Nick-Zoc/My-Terminal-Setup" -ForegroundColor Yellow
}
