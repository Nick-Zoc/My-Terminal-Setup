# Enhanced Powershell Setup Script - Automated Installation
# This script installs and configures a beautiful PowerShell terminal setup
# Includes Oh My Posh themes, Fastfetch, Nerd Fonts, and useful aliases

# Ensure script runs from its directory
Set-Location -Path $PSScriptRoot

# Clear screen for better presentation
Clear-Host

# Beautiful Tech-Themed ASCII Art Header
Write-Host "    ========================================================================" -ForegroundColor DarkGray
Write-Host "    |                       POWERSHELL THEME MANAGER                       |" -ForegroundColor White
Write-Host "    |              Beautiful Nord Theme + Productivity Tools               |" -ForegroundColor White
Write-Host "    ========================================================================" -ForegroundColor DarkGray
Write-Host ""
Write-Host "    This will install:" -ForegroundColor White
Write-Host "      - Oh My Posh (PowerLine themes)" -ForegroundColor Gray
Write-Host "      - Fastfetch (System information)" -ForegroundColor Gray  
Write-Host "      - Hack Nerd Font (Programming font)" -ForegroundColor Gray
Write-Host "      - Custom PowerShell profile (Aliases & config)" -ForegroundColor Gray
Write-Host ""

# Hacker-style initialization for setup
function Show-Initialization {
    Write-Host "    ========================================================================" -ForegroundColor Green
    Write-Host "    |                               INITIALIZING                           |" -ForegroundColor Green
    Write-Host "    ========================================================================" -ForegroundColor Green
    Write-Host ""
    
    $loadingSteps = @(
        "Scanning system architecture", 
        "Bypassing security protocols", 
        "Accessing installation matrix", 
        "Loading deployment tools"
    )
    
    # Hacker-style animated progress
    $progressChars = @('|', '/', '-', '\')
    
    for ($i = 0; $i -lt $loadingSteps.Length; $i++) {
        Write-Host "    [$(Get-Date -Format "HH:mm:ss")] $($loadingSteps[$i])..." -ForegroundColor Gray -NoNewline
        
        # Animated spinning progress with green theme
        for ($spin = 0; $spin -lt 10; $spin++) {
            $char = $progressChars[$spin % 4]
            Write-Host " [$char]" -ForegroundColor Green -NoNewline
            Start-Sleep -Milliseconds 150  # 10 * 150ms = 1.5 seconds total
            Write-Host "`b`b`b`b" -NoNewline  # Backspace to overwrite
        }
        
        Write-Host " [OK]" -ForegroundColor Green
        Start-Sleep -Milliseconds 200
    }
    
    Write-Host ""
    Write-Host "    ========================================================================" -ForegroundColor Green
    Write-Host "    |                         Script  Initialized!                         |" -ForegroundColor Green
    Write-Host "    ========================================================================" -ForegroundColor Green
    Write-Host ""
    Start-Sleep -Milliseconds 500
}

# Enhanced animated progress function - Purple theme for installation
function Show-AnimatedProgress {
    param($Step, $Total, $Message, $SubMessage = "", $Duration = 1500)  # Changed to 1.5 seconds
    
    $percent = [math]::Round(($Step / $Total) * 100)
    $progressChars = [math]::Floor($percent / 5)
    
    # Beautiful ASCII art progress frames - no special characters
    $frames = @(
        "   [>  ]  ",
        "   [>> ]  ",
        "   [>>>]  ",
        "   [<>>]  ",
        "   [<<>]  ",
        "   [<<<]  ",
        "   [<< ]  ",
        "   [<  ]  "
    )
    
    Write-Host ""
    Write-Host "    ================================================================" -ForegroundColor DarkGray
    Write-Host "    |   [$("=" * $progressChars)$("-" * (20 - $progressChars))] $percent% ($Step/$Total)" -ForegroundColor Magenta
    Write-Host "    |" -ForegroundColor DarkGray
    Write-Host "    |   > $Message" -ForegroundColor Yellow
    if ($SubMessage) {
        Write-Host "    |     - $SubMessage" -ForegroundColor Gray
    }
    Write-Host "    |" -ForegroundColor DarkGray
    
    # Animated spinner with purple theme - adjusted timing for 1-1.5 seconds
    $iterations = [math]::Floor($Duration / 125)  # Changed to 125ms per iteration
    for ($i = 0; $i -lt $iterations; $i++) {
        $frame = $frames[$i % $frames.Length]
        Write-Host "    |   $frame Installing..." -ForegroundColor Magenta -NoNewline
        Write-Host "`r" -NoNewline
        Start-Sleep -Milliseconds 125  # Each frame shows for 125ms
    }
    
    Write-Host "    |   [SUCCESS] Complete!                    " -ForegroundColor Green
    Write-Host "    ================================================================" -ForegroundColor DarkGray
    Write-Host ""
}

# Call initialization animation
Show-Initialization

# Enhanced progress function with creative ASCII progress bars
function Show-Progress {
    param($Step, $Total, $Message, $SubMessage = "")
    $percent = [math]::Round(($Step / $Total) * 100)
    $progressChars = [math]::Floor($percent / 5)
    
    # Simple progress bar using only basic ASCII characters
    $progressBar = "=" * $progressChars + "-" * (20 - $progressChars)
    
    Write-Host ""
    Write-Host "    ================================================================" -ForegroundColor DarkGray
    Write-Host "    | [$progressBar] $percent% ($Step/$Total)" -ForegroundColor Cyan
    Write-Host "    |" -ForegroundColor DarkGray
    Write-Host "    | > $Message" -ForegroundColor Yellow
    if ($SubMessage) {
        Write-Host "    |   - $SubMessage" -ForegroundColor Gray
    }
    Write-Host "    ================================================================" -ForegroundColor DarkGray
}

# Helper functions for consistent messaging
function Show-Success {
    param($Message)
    Write-Host "        [SUCCESS] $Message" -ForegroundColor Green
}

function Show-Skip {
    param($Message)
    Write-Host "        [SKIP] $Message" -ForegroundColor Blue
}

function Show-Error {
    param($Message)
    Write-Host "        [ERROR] $Message" -ForegroundColor Red
}

# Define installation steps
$totalSteps = 6
$currentStep = 0

# Step 1: Check and install Git
$currentStep++
Show-AnimatedProgress $currentStep $totalSteps "Checking Git installation" "Required for version control and theme management"
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "   Installing Git via winget..." -ForegroundColor Blue
    try {
        winget install Git.Git -s winget -e --accept-package-agreements --accept-source-agreements | Out-Null
        Show-Success "Git installed successfully"
    }
    catch {
        Show-Error "Failed to install Git: $($_.Exception.Message)"
    }
}
else {
    Show-Skip "Git already installed"
}

# Step 2: Install Oh My Posh
$currentStep++
Show-AnimatedProgress $currentStep $totalSteps "Installing Oh My Posh" "The powerline prompt theme engine"
if (!(Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    Write-Host "   Installing Oh My Posh via winget..." -ForegroundColor Blue
    try {
        winget install JanDeDobbeleer.OhMyPosh -s winget -e --accept-package-agreements --accept-source-agreements | Out-Null
        Show-Success "Oh My Posh installed successfully"
    }
    catch {
        Show-Error "Failed to install Oh My Posh: $($_.Exception.Message)"
    }
}
else {
    Show-Skip "Oh My Posh already installed"
}

# Step 3: Install Fastfetch
$currentStep++
Show-AnimatedProgress $currentStep $totalSteps "Installing Fastfetch" "Fast system info display tool"
if (!(Get-Command fastfetch -ErrorAction SilentlyContinue)) {
    Write-Host "   Installing Fastfetch via winget..." -ForegroundColor Blue
    try {
        winget install fastfetch -s winget -e --accept-package-agreements --accept-source-agreements | Out-Null
        Show-Success "Fastfetch installed successfully"
    }
    catch {
        Show-Error "Failed to install Fastfetch: $($_.Exception.Message)"
    }
}
else {
    Show-Skip "Fastfetch already installed"
}

# Step 4: Install Hack Nerd Font
$currentStep++
Show-AnimatedProgress $currentStep $totalSteps "Installing Hack Nerd Font" "Beautiful programming font with icons and symbols"

# Function to install Hack Nerd Font from GitHub
function Install-HackNerdFont {
    try {
        Write-Host "   Downloading Hack Nerd Font from GitHub..." -ForegroundColor Blue
        
        # Get latest release info
        $release = Invoke-RestMethod "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"
        $hackAsset = $release.assets | Where-Object { $_.name -eq "Hack.zip" }
        
        if (!$hackAsset) {
            throw "Hack Nerd Font not found in latest release"
        }
        
        # Create temp directory
        $tempDir = "$env:TEMP\HackNerdFont"
        New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
        
        # Download the font
        $zipPath = "$tempDir\Hack.zip"
        Invoke-WebRequest -Uri $hackAsset.browser_download_url -OutFile $zipPath
        
        Write-Host "   Extracting and installing fonts..." -ForegroundColor Blue
        
        # Extract the zip
        Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force
        
        # Install fonts
        $fontFiles = Get-ChildItem "$tempDir\*.ttf" -ErrorAction SilentlyContinue
        if ($fontFiles.Count -eq 0) {
            throw "No TTF font files found in the archive"
        }
        
        foreach ($font in $fontFiles) {
            $fontName = $font.Name
            $fontDestination = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\$fontName"
            
            # Copy font to user fonts directory
            Copy-Item $font.FullName $fontDestination -Force
            
            # Register the font
            $fontRegName = $fontName -replace '\.ttf$', ' (TrueType)'
            New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name $fontRegName -Value $fontName -PropertyType String -Force | Out-Null
        }
        
        # Cleanup
        Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
        
        return $fontFiles.Count
    }
    catch {
        Write-Host "   [WARNING] Primary installation failed: $($_.Exception.Message)" -ForegroundColor Yellow
        Write-Host "   Trying fallback installation..." -ForegroundColor Blue
        
        # Fallback to regular Hack fonts
        try {
            winget install SourceFoundry.HackFonts -s winget -e --accept-package-agreements --accept-source-agreements | Out-Null
            return -1  # Indicate fallback success
        }
        catch {
            throw "Both primary and fallback installations failed: $($_.Exception.Message)"
            return $false
        }
    }
}

# Check if Hack Nerd Font is already installed
$hackInstalled = Get-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -ErrorAction SilentlyContinue | 
Where-Object { $_.PSObject.Properties.Name -like "*Hack*" -and $_.PSObject.Properties.Name -like "*Nerd*" }

if ($hackInstalled) {
    Show-Skip "Hack Nerd Font already installed"
}
else {
    try {
        $result = Install-HackNerdFont
        if ($result -eq -1) {
            Show-Success "Hack Fonts installed (fallback)"
        }
        elseif ($result -gt 0) {
            Show-Success "Hack Nerd Font installed ($result fonts)"
        }
    }
    catch {
        Show-Error "Font installation failed: $($_.Exception.Message)"
    }
}

# Step 5: Create PowerShell profile folder and copy profile
$currentStep++
Show-AnimatedProgress $currentStep $totalSteps "Setting up PowerShell profile" "Creating custom profile with aliases and theme configuration"
$profileFolder = Split-Path -Parent $PROFILE
if (!(Test-Path $profileFolder)) {
    Write-Host "   Creating profile directory..." -ForegroundColor Blue
    New-Item -ItemType Directory -Path $profileFolder -Force | Out-Null
}

if (Test-Path "..\Config\Microsoft.PowerShell_profile.ps1") {
    Write-Host "   Copying PowerShell profile..." -ForegroundColor Blue
    Copy-Item -Path "..\Config\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE -Force
    Show-Success "PowerShell profile configured"
}
else {
    Show-Error "PowerShell profile file not found!"
}

# Step 6: Copy Oh My Posh theme
$currentStep++
Show-AnimatedProgress $currentStep $totalSteps "Installing custom theme" "Beautiful Nord theme configuration"
$ompThemesPath = "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes"
if (!(Test-Path $ompThemesPath)) {
    Write-Host "   Creating Oh My Posh themes directory..." -ForegroundColor Blue
    New-Item -Path $ompThemesPath -ItemType Directory -Force | Out-Null
}

if (Test-Path "..\Config\nordcustom.omp.json") {
    Write-Host "   Installing Nord custom theme..." -ForegroundColor Blue
    Copy-Item -Path "..\Config\nordcustom.omp.json" -Destination "$ompThemesPath\nordcustom.omp.json" -Force
    # Also copy to user home directory for profile access
    Copy-Item -Path "..\Config\nordcustom.omp.json" -Destination "$env:USERPROFILE\nordcustom.omp.json" -Force
    Show-Success "Custom Nord theme installed"
}
else {
    Show-Error "Theme file not found!"
}

# Installation completed successfully - Amazing completion screen
Write-Host ""
Write-Host ""
Write-Host "    ========================================================================" -ForegroundColor Green
Write-Host "                              SETUP COMPLETED!" -ForegroundColor Green
Write-Host "                        NICK ZOC'S POWERSHELL SETUP" -ForegroundColor Cyan
Write-Host "                               IS NOW READY!" -ForegroundColor Cyan
Write-Host "    ========================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "    ----------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "    |                   INSTALLED COMPONENTS                       |" -ForegroundColor DarkGray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    |  > Oh My Posh      - Powerline prompt theme engine           |" -ForegroundColor Gray
Write-Host "    |  > Fastfetch       - Fast system info display                |" -ForegroundColor Gray
Write-Host "    |  > Hack Nerd Font  - Programming font with icons             |" -ForegroundColor Gray
Write-Host "    |  > Custom Theme    - Beautiful Nord prompt theme             |" -ForegroundColor Gray
Write-Host "    |  > PowerShell Profile - Useful aliases and functions         |" -ForegroundColor Gray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    ----------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""
Write-Host "    > RESTART YOUR POWERSHELL/TERMINAL to see the amazing changes!" -ForegroundColor Yellow
Write-Host ""
Write-Host "    > New aliases: ll, .., grep, top, htop, fetch" -ForegroundColor White
Write-Host ""
Write-Host "    ========================================================================" -ForegroundColor DarkGray
