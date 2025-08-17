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
Write-Host "      - PSReadLine (Advanced autocomplete)" -ForegroundColor Gray
Write-Host "      - Hack Nerd Font (Programming font)" -ForegroundColor Gray
Write-Host "      - Windows Terminal (Transparency, fonts & size)" -ForegroundColor Gray
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
        "Ensuring security protocols", 
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
# Enhanced progress function with dynamic status updates
function Show-DynamicProgress {
    param($Step, $Total, $Message, $SubMessage = "")
    
    $percent = [math]::Round(($Step / $Total) * 100)
    $progressChars = [math]::Floor($percent / 5)
    
    Write-Host ""
    Write-Host "    ================================================================" -ForegroundColor DarkGray
    Write-Host "    |   [$("=" * $progressChars)$("-" * (20 - $progressChars))] $percent% ($Step/$Total)" -ForegroundColor Cyan
    Write-Host "    |" -ForegroundColor DarkGray
    Write-Host "    |   > $Message" -ForegroundColor Yellow
    if ($SubMessage) {
        Write-Host "    |     - $SubMessage" -ForegroundColor Gray
    }
    Write-Host "    |" -ForegroundColor DarkGray
    # Note: No automatic completion - status will be updated dynamically
}

# Function to update the progress box with status
function Update-ProgressStatus {
    param($Status, $Message, $Color = "White")
    
    $statusColors = @{
        "SUCCESS" = "Green"
        "SKIP"    = "Blue" 
        "WARNING" = "Yellow"
        "ERROR"   = "Red"
        "WORKING" = "Cyan"
    }
    
    if ($statusColors.ContainsKey($Status)) {
        $Color = $statusColors[$Status]
    }
    
    Write-Host "    |   [$Status] $Message" -ForegroundColor $Color
    Start-Sleep -Seconds 1  # Add delay so user can read the status
}

# Function to close the progress box
function Close-ProgressBox {
    Write-Host "    ================================================================" -ForegroundColor DarkGray
    Write-Host ""
}

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
    Write-Host "    |   [$("=" * $progressChars)$("-" * (20 - $progressChars))] $percent% ($Step/$Total)" -ForegroundColor Cyan
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
        Write-Host "    |   $frame Installing..." -ForegroundColor cyan -NoNewline
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
$totalSteps = 9
$currentStep = 0

# Step 1: Check and install Git
$currentStep++
Show-DynamicProgress $currentStep $totalSteps "Checking Git installation" "Required for version control and theme management"
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Update-ProgressStatus "WORKING" "Installing Git via winget..."
    try {
        winget install Git.Git -s winget -e --accept-package-agreements --accept-source-agreements | Out-Null
        Update-ProgressStatus "SUCCESS" "Git installed successfully"
    }
    catch {
        Update-ProgressStatus "ERROR" "Failed to install Git: $($_.Exception.Message)"
    }
}
else {
    Update-ProgressStatus "SKIP" "Git already installed"
}
Close-ProgressBox

# Step 2: Install Oh My Posh
$currentStep++
Show-DynamicProgress $currentStep $totalSteps "Installing Oh My Posh" "The powerline prompt theme engine"
if (!(Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    Update-ProgressStatus "WORKING" "Installing Oh My Posh via winget..."
    try {
        winget install JanDeDobbeleer.OhMyPosh -s winget -e --accept-package-agreements --accept-source-agreements | Out-Null
        Update-ProgressStatus "SUCCESS" "Oh My Posh installed successfully"
    }
    catch {
        Update-ProgressStatus "ERROR" "Failed to install Oh My Posh: $($_.Exception.Message)"
    }
}
else {
    Update-ProgressStatus "SKIP" "Oh My Posh already installed"
}
Close-ProgressBox

# Step 3: Install Fastfetch
$currentStep++
Show-DynamicProgress $currentStep $totalSteps "Installing Fastfetch" "Fast system info display tool"
if (!(Get-Command fastfetch -ErrorAction SilentlyContinue)) {
    Update-ProgressStatus "WORKING" "Installing Fastfetch via winget..."
    try {
        winget install fastfetch -s winget -e --accept-package-agreements --accept-source-agreements | Out-Null
        Update-ProgressStatus "SUCCESS" "Fastfetch installed successfully"
    }
    catch {
        Update-ProgressStatus "ERROR" "Failed to install Fastfetch: $($_.Exception.Message)"
    }
}
else {
    Update-ProgressStatus "SKIP" "Fastfetch already installed"
}
Close-ProgressBox

# Step 4: Install/Update PSReadLine for autocomplete suggestions
$currentStep++
Show-DynamicProgress $currentStep $totalSteps "Installing PSReadLine" "Advanced autocomplete and command history"
try {
    # Check if PSReadLine is installed and get version
    $psReadLineModule = Get-Module -ListAvailable PSReadLine | Sort-Object Version -Descending | Select-Object -First 1
    
    if (!$psReadLineModule) {
        Update-ProgressStatus "WORKING" "Installing PSReadLine module..."
        Install-Module -Name PSReadLine -Force -SkipPublisherCheck -Scope CurrentUser | Out-Null
        Update-ProgressStatus "SUCCESS" "PSReadLine installed successfully"
    }
    else {
        # Check if it's an older version (less than 2.0.0)
        $currentVersion = $psReadLineModule.Version
        $minimumVersion = [Version]"2.0.0"
        
        if ($currentVersion -lt $minimumVersion) {
            Update-ProgressStatus "WORKING" "Updating PSReadLine to latest version..."
            Install-Module -Name PSReadLine -Force -SkipPublisherCheck -Scope CurrentUser | Out-Null
            Update-ProgressStatus "SUCCESS" "PSReadLine updated to latest version"
        }
        else {
            Update-ProgressStatus "SKIP" "PSReadLine already installed (v$currentVersion)"
        }
    }
}
catch {
    Update-ProgressStatus "ERROR" "Failed to install/update PSReadLine: $($_.Exception.Message)"
}
Close-ProgressBox

# Step 5: Install ntop for process monitoring
$currentStep++
Show-DynamicProgress $currentStep $totalSteps "Installing ntop" "Process monitoring tool for top/htop aliases"
if (!(Get-Command ntop -ErrorAction SilentlyContinue)) {
    Update-ProgressStatus "WORKING" "Installing ntop via winget..."
    try {
        winget install gsass1.NTop -s winget -e --accept-package-agreements --accept-source-agreements | Out-Null
        Update-ProgressStatus "SUCCESS" "ntop installed successfully"
    }
    catch {
        Update-ProgressStatus "WARNING" "Failed to install ntop via winget, trying alternative..."
        try {
            # Try alternative package name
            winget install "ntop" -s winget -e --accept-package-agreements --accept-source-agreements | Out-Null
            Update-ProgressStatus "SUCCESS" "ntop installed successfully (alternative)"
        }
        catch {
            Update-ProgressStatus "ERROR" "Failed to install ntop: $($_.Exception.Message)"
        }
    }
}
else {
    Update-ProgressStatus "SKIP" "ntop already installed"
}
Close-ProgressBox

# Step 6: Install Hack Nerd Font
$currentStep++
Show-DynamicProgress $currentStep $totalSteps "Installing Hack Nerd Font" "Beautiful programming font with icons and symbols"

# Function to install Hack Nerd Font from GitHub
function Install-HackNerdFont {
    try {
        Update-ProgressStatus "WORKING" "Downloading Hack Nerd Font from GitHub..."
        
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
        
        Update-ProgressStatus "WORKING" "Extracting and installing fonts..."
        
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
        Update-ProgressStatus "WARNING" "Primary installation failed: $($_.Exception.Message)"
        Update-ProgressStatus "WORKING" "Trying fallback installation..."
        
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
    Update-ProgressStatus "SKIP" "Hack Nerd Font already installed"
}
else {
    try {
        $result = Install-HackNerdFont
        if ($result -eq -1) {
            Update-ProgressStatus "SUCCESS" "Hack Fonts installed (fallback)"
        }
        elseif ($result -gt 0) {
            Update-ProgressStatus "SUCCESS" "Hack Nerd Font installed ($result fonts)"
        }
    }
    catch {
        Update-ProgressStatus "ERROR" "Font installation failed: $($_.Exception.Message)"
    }
}
Close-ProgressBox

# Step 7: Create PowerShell profile folder and copy profile
$currentStep++
Show-DynamicProgress $currentStep $totalSteps "Setting up PowerShell profile" "Creating custom profile with aliases and theme configuration"
$profileFolder = Split-Path -Parent $PROFILE
if (!(Test-Path $profileFolder)) {
    Update-ProgressStatus "WORKING" "Creating profile directory..."
    New-Item -ItemType Directory -Path $profileFolder -Force | Out-Null
}

if (Test-Path "..\Config\Microsoft.PowerShell_profile.ps1") {
    Update-ProgressStatus "WORKING" "Copying PowerShell profile..."
    Copy-Item -Path "..\Config\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE -Force
    Update-ProgressStatus "SUCCESS" "PowerShell profile configured"
}
else {
    Update-ProgressStatus "ERROR" "PowerShell profile file not found!"
}
Close-ProgressBox

# Step 8: Copy Oh My Posh theme
$currentStep++
Show-DynamicProgress $currentStep $totalSteps "Installing custom theme" "Beautiful Nord theme configuration"
$ompThemesPath = "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes"
if (!(Test-Path $ompThemesPath)) {
    Update-ProgressStatus "WORKING" "Creating Oh My Posh themes directory..."
    New-Item -Path $ompThemesPath -ItemType Directory -Force | Out-Null
}

if (Test-Path "..\Config\nordcustom.omp.json") {
    Update-ProgressStatus "WORKING" "Installing Nord custom theme..."
    Copy-Item -Path "..\Config\nordcustom.omp.json" -Destination "$ompThemesPath\nordcustom.omp.json" -Force
    # Also copy to user home directory for profile access
    Copy-Item -Path "..\Config\nordcustom.omp.json" -Destination "$env:USERPROFILE\nordcustom.omp.json" -Force
    Update-ProgressStatus "SUCCESS" "Custom Nord theme installed"
}
else {
    Update-ProgressStatus "ERROR" "Theme file not found!"
}
Close-ProgressBox

# Step 9: Configure Windows Terminal settings
$currentStep++
Show-DynamicProgress $currentStep $totalSteps "Configuring Windows Terminal" "Applying transparency, acrylic effects and fonts"

# Function to configure Windows Terminal
function Set-WindowsTerminalConfig {
    try {
        # Find Windows Terminal settings path
        $terminalPackagePath = Get-ChildItem "$env:LOCALAPPDATA\Packages" -Directory | Where-Object { $_.Name -like "*WindowsTerminal*" } | Select-Object -First 1
        
        if (!$terminalPackagePath) {
            Update-ProgressStatus "SKIP" "Windows Terminal not found - skipping configuration"
            return $false
        }
        
        $settingsPath = "$($terminalPackagePath.FullName)\LocalState\settings.json"
        
        if (!(Test-Path $settingsPath)) {
            Update-ProgressStatus "SKIP" "Windows Terminal settings file not found"
            return $false
        }
        
        Update-ProgressStatus "WORKING" "Backing up existing Windows Terminal settings..."
        $timestamp = (Get-Date).ToString("yyyyMMdd-HHmmss")
        $backupPath = "$($terminalPackagePath.FullName)\LocalState\settings.nick-terminal-mgr-backup-$timestamp.json"
        Copy-Item $settingsPath $backupPath -Force -ErrorAction SilentlyContinue
        
        Update-ProgressStatus "WORKING" "Reading current Windows Terminal settings..."
        $settingsContent = Get-Content $settingsPath -Raw -Encoding UTF8
        $settings = $settingsContent | ConvertFrom-Json
        
        # Ensure profiles structure exists
        if (!$settings.profiles) {
            $settings | Add-Member -Name "profiles" -Value @{} -MemberType NoteProperty
        }
        if (!$settings.profiles.defaults) {
            $settings.profiles | Add-Member -Name "defaults" -Value @{} -MemberType NoteProperty
        }
        
        Update-ProgressStatus "WORKING" "Applying terminal appearance configuration..."
        
        # Configure default profile settings (font, transparency, acrylic only)
        $terminalDefaults = @{
            "font"       = @{
                "face" = "Hack Nerd Font"
                "size" = 11
            }
            "opacity"    = 30
            "useAcrylic" = $true
        }
        
        # Apply settings to defaults
        foreach ($key in $terminalDefaults.Keys) {
            if ($settings.profiles.defaults.PSObject.Properties.Name -contains $key) {
                $settings.profiles.defaults.$key = $terminalDefaults[$key]
            }
            else {
                $settings.profiles.defaults | Add-Member -Name $key -Value $terminalDefaults[$key] -MemberType NoteProperty
            }
        }
        
        # Configure window settings (startup size and center on launch)
        $windowSettings = @{
            "initialCols"    = 140
            "initialRows"    = 45
            "centerOnLaunch" = $true
        }
        
        # Apply window settings to main settings object
        foreach ($key in $windowSettings.Keys) {
            if ($settings.PSObject.Properties.Name -contains $key) {
                $settings.$key = $windowSettings[$key]
            }
            else {
                $settings | Add-Member -Name $key -Value $windowSettings[$key] -MemberType NoteProperty
            }
        }
        
        Update-ProgressStatus "WORKING" "Saving Windows Terminal configuration..."
        $updatedContent = $settings | ConvertTo-Json -Depth 10
        Set-Content $settingsPath -Value $updatedContent -Encoding UTF8
        
        return $true
    }
    catch {
        Update-ProgressStatus "WARNING" "Could not configure Windows Terminal: $($_.Exception.Message)"
        return $false
    }
}

# Apply Windows Terminal configuration
$terminalConfigured = Set-WindowsTerminalConfig
if ($terminalConfigured) {
    Update-ProgressStatus "SUCCESS" "Windows Terminal configured with transparency and fonts"
}
else {
    Update-ProgressStatus "SKIP" "Windows Terminal configuration skipped"
}
Close-ProgressBox

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
Write-Host "    |  > PSReadLine      - Advanced autocomplete & suggestions     |" -ForegroundColor Gray
Write-Host "    |  > Hack Nerd Font  - Programming font with icons             |" -ForegroundColor Gray
Write-Host "    |  > Custom Theme    - Beautiful Nord prompt theme             |" -ForegroundColor Gray
Write-Host "    |  > Windows Terminal - Transparency, fonts & window size      |" -ForegroundColor Gray
Write-Host "    |  > PowerShell Profile - Useful aliases and functions         |" -ForegroundColor Gray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    ----------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""
Write-Host "    > RESTART YOUR POWERSHELL/TERMINAL to see the amazing changes!" -ForegroundColor Yellow
Write-Host ""
Write-Host "    > New aliases: ll, .., grep, top, htop, fetch" -ForegroundColor White
Write-Host ""
Write-Host "    ========================================================================" -ForegroundColor DarkGray

# Return to root directory if we're in Scripts folder
if ((Get-Location).Path -like "*\Scripts") {
    Set-Location ".."
}
