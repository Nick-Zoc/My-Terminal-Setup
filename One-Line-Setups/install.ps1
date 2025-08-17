# Nick Zoc's PowerShell Theme Manager - One-Liner Installer
# This script downloads and runs the full PowerShell Theme Manager automatically
# Usage: iwr -useb "https://raw.githubusercontent.com/Nick-Zoc/My-Terminal-Setup/main/One-Line-Setups/install.ps1" | iex

Clear-Host

Write-Host ""
Write-Host "    ================================================================" -ForegroundColor Cyan
Write-Host "    |          Nick Zoc's PowerShell Theme Manager                 |" -ForegroundColor Cyan  
Write-Host "    |                   One-Line Installer                         |" -ForegroundColor Cyan
Write-Host "    ================================================================" -ForegroundColor Cyan
Write-Host ""

# Create temp directory for download
$tempDir = "$env:TEMP\NickZocPowerShellThemeManager"
if (Test-Path $tempDir) { 
    Write-Host "    Cleaning up previous download..." -ForegroundColor Yellow
    Remove-Item $tempDir -Recurse -Force 
}
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

Write-Host "    Downloading PowerShell Theme Manager from GitHub..." -ForegroundColor Cyan

# Download the repository as ZIP
$zipUrl = "https://github.com/Nick-Zoc/My-Terminal-Setup/archive/refs/heads/main.zip"
$zipPath = "$tempDir\theme-manager.zip"

try {
    # Download with progress
    Write-Host "    > Fetching latest version..." -ForegroundColor Gray
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing
    
    # Extract the ZIP
    Write-Host "    > Extracting files..." -ForegroundColor Gray
    Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force
    
    # Navigate to the extracted folder and run Terminal Manager
    $extractedPath = "$tempDir\My-Terminal-Setup-main"
    
    if (Test-Path "$extractedPath\Terminal-Manager.ps1") {
        Write-Host "    > Launching Terminal Manager..." -ForegroundColor Gray
        Write-Host ""
        
        # Change to the extracted directory and run Terminal Manager
        Set-Location $extractedPath
        & ".\Terminal-Manager.ps1"
        
        Write-Host ""
        Write-Host "    ================================================================" -ForegroundColor Green
        Write-Host "    |                    Installation Complete!                   |" -ForegroundColor Green
        Write-Host "    ================================================================" -ForegroundColor Green
    }
    else {
        Write-Host "    [ERROR] Terminal Manager not found in downloaded files" -ForegroundColor Red
        Write-Host "    Please try downloading manually: https://github.com/Nick-Zoc/My-Terminal-Setup" -ForegroundColor Yellow
    }
    
}
catch {
    Write-Host ""
    Write-Host "    [ERROR] Download failed: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "    Alternative methods:" -ForegroundColor Yellow
    Write-Host "    1. Manual download: https://github.com/Nick-Zoc/My-Terminal-Setup" -ForegroundColor Gray
    Write-Host "    2. Git clone: git clone https://github.com/Nick-Zoc/My-Terminal-Setup.git" -ForegroundColor Gray
    Write-Host ""
}
finally {
    # Cleanup temp files
    try {
        Write-Host "    > Cleaning up temporary files..." -ForegroundColor Gray
        if (Test-Path $tempDir) {
            Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
    catch {
        # Silent cleanup failure
    }
}
