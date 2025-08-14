# Nick Zoc's PowerShell Theme Setup - One-Liner Error Fix
# This script downloads and runs just the error fix (option 1 from revert script)

# Create temp directory for download
$tempDir = "$env:TEMP\NickZocPowerShellFix"
if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force }
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

Write-Host "Downloading PowerShell theme error fix..." -ForegroundColor Cyan

# Download the repository as ZIP  
$zipUrl = "https://github.com/Nick-Zoc/My-Terminal-Setup/archive/refs/heads/main.zip"
$zipPath = "$tempDir\setup.zip"

try {
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
    
    # Extract the ZIP
    Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force
    
    # Get the fixed profile
    $extractedPath = "$tempDir\My-Terminal-Setup-main"  
    $fixedProfile = "$extractedPath\Config\Microsoft.PowerShell_profile.ps1"
    
    if (Test-Path $fixedProfile) {
        # Create profile directory if it doesn't exist
        $profileDir = Split-Path -Parent $PROFILE
        if (!(Test-Path $profileDir)) {
            New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
        }
        
        # Copy the fixed profile
        Copy-Item -Path $fixedProfile -Destination $PROFILE -Force
        
        Write-Host ""
        Write-Host "[SUCCESS] PowerShell profile fixed!" -ForegroundColor Green
        Write-Host "Please restart your terminal - errors should be gone!" -ForegroundColor Yellow
    }
    else {
        Write-Host "[ERROR] Could not find fixed profile file." -ForegroundColor Red
    }
    
    # Cleanup
    Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
    
}
catch {
    Write-Host "Error downloading fix: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Please try downloading manually from: https://github.com/Nick-Zoc/My-Terminal-Setup" -ForegroundColor Yellow
}
