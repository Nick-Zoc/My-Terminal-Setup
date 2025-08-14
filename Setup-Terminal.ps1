# Ensure script runs from its directory
Set-Location -Path $PSScriptRoot

# Install essential tools
winget install JanDeDobbeleer.OhMyPosh -s winget -e
winget install fastfetch -s winget -e
winget install Git.Git -s winget -e
winget install Microsoft.PowerShell -s winget -e
choco install fzf -y
choco install nerd-fonts-hack -y

# Create PowerShell profile folder if it doesn't exist
$profileFolder = Split-Path -Parent $PROFILE
if (!(Test-Path $profileFolder)) {
    New-Item -ItemType Directory -Path $profileFolder -Force
}

# Copy custom PowerShell profile
Copy-Item -Path ".\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE -Force

# Copy your oh-my-posh theme
$ompThemesPath = "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes"
if (!(Test-Path $ompThemesPath)) {
    New-Item -Path $ompThemesPath -ItemType Directory -Force
}
Copy-Item -Path ".\nordcustom.omp.json" -Destination "$ompThemesPath\nordcustom.omp.json" -Force

# Set theme config in your profile
Write-Host "✅ Terminal setup script finished. Please restart your terminal."
