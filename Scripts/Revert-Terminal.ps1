# Clear screen for better presentation
Clear-Host
# Term# Cool Tech-Themed ASCII Art Header (Warning/Error Theme)
Write-Host ""
Write-Host "    ##############################################" -ForegroundColor Yellow
Write-Host "    ##                                          ##" -ForegroundColor Red
Write-Host "    ##    !!!!!!!!!               !!!!!!!!!!    ##" -ForegroundColor Red
Write-Host "    ##    !       !               ! XX  XX !    ##" -ForegroundColor Red
Write-Host "    ##    ! ERROR !    WARNING    !   XX   !    ##" -ForegroundColor Red
Write-Host "    ##    !       !               ! XX  XX !    ##" -ForegroundColor Red
Write-Host "    ##    !!!!!!!!!               !!!!!!!!!!    ##" -ForegroundColor Red
Write-Host "    ##                                          ##" -ForegroundColor Red
Write-Host "    ##############################################" -ForegroundColor Yellow

# Nick Zoc's Powershell Revert Script - Clean Uninstallation & Error Fixing
# This script can either fix PowerShell profile errors or completely remove Powershell customizations

Write-Host "    ========================================================================" -ForegroundColor Red
Write-Host "    |                           REVERT TOOL                                |" -ForegroundColor Red
Write-Host "    |                     FIX ERRORS OR CLEAN RESET                        |" -ForegroundColor Yellow
Write-Host "    ========================================================================" -ForegroundColor Red
Write-Host ""
Write-Host "    This tool can help you:" -ForegroundColor White
Write-Host ""
Write-Host "    ----------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    |  1. Fix PowerShell Profile Errors (Recommended)              |" -ForegroundColor Green
Write-Host "    |     - Fixes command not found errors                         |" -ForegroundColor Gray
Write-Host "    |     - Keeps all customizations intact                        |" -ForegroundColor Gray
Write-Host "    |     - Safe and quick solution                                |" -ForegroundColor Gray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    |  2. Complete Powershell Theme Reset                          |" -ForegroundColor Yellow
Write-Host "    |     - Removes all customizations                             |" -ForegroundColor Gray
Write-Host "    |     - Uninstalls Oh My Posh, Fastfetch, ntop, etc.           |" -ForegroundColor Gray
Write-Host "    |     - Returns to default PowerShell                          |" -ForegroundColor Gray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    ----------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""
Write-Host "    =====================================================================" -ForegroundColor DarkGray

# Animated loading for revert operations
function Show-RevertProgress {
    param($Message, $Duration = 1500)
    
    Write-Host ""
    Write-Host "    ================================================================" -ForegroundColor Yellow
    Write-Host "    |   > $Message" -ForegroundColor Cyan
    Write-Host "    |" -ForegroundColor DarkGray
    
    # Animated progress
    $chars = @('|', '/', '-', '\\')
    $iterations = [math]::Floor($Duration / 100)
    
    for ($i = 0; $i -lt $iterations; $i++) {
        $char = $chars[$i % 4]
        Write-Host "    |   [$char] Working..." -ForegroundColor cyan -NoNewline
        Write-Host "`r" -NoNewline
        Start-Sleep -Milliseconds 100
    }
    
    Write-Host "    |   [DONE] Operation completed!              " -ForegroundColor Green
    Write-Host "    ================================================================" -ForegroundColor Yellow
    Write-Host ""
}

$choice = Read-Host "    Choose option (1 to fix errors, 2 for complete removal, or 'q' to quit)"

if ($choice -eq 'q') {
    Write-Host "Operation cancelled." -ForegroundColor Blue
    exit
}
elseif ($choice -eq '1') {
    Write-Host ""
    Write-Host "    ========================================================================" -ForegroundColor Green
    Write-Host "    |                   FIXING POWERSHELL PROFILE ERRORS                  |" -ForegroundColor Green
    Write-Host "    ========================================================================" -ForegroundColor Green
    Write-Host ""
    
    Show-RevertProgress "Backing up current profile" 1000
    Show-RevertProgress "Applying error-safe configuration" 1500
    Show-RevertProgress "Updating PowerShell settings" 1200
    
    # Copy the fixed profile
    $scriptDir = Split-Path -Parent $PSScriptRoot
    $fixedProfile = "$scriptDir\Microsoft.PowerShell_profile.ps1"
    
    if (Test-Path $fixedProfile) {
        $profileDir = Split-Path -Parent $PROFILE
        if (!(Test-Path $profileDir)) {
            New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
        }
        
        Copy-Item -Path $fixedProfile -Destination $PROFILE -Force
        
        Write-Host "    ========================================================================" -ForegroundColor Green
        Write-Host "    |                         FIX COMPLETED!                              |" -ForegroundColor Green
        Write-Host "    ========================================================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "    [SUCCESS] PowerShell profile fixed successfully!" -ForegroundColor Green
        Write-Host ""
        Write-Host "    Please restart your PowerShell/terminal to see the changes." -ForegroundColor Yellow
        Write-Host "    Your customizations are preserved - errors should be gone!" -ForegroundColor Gray
    }
    else {
        Write-Host ""
        Write-Host "[ERROR] Fixed profile file not found!" -ForegroundColor Red
        Write-Host "Expected location: $fixedProfile" -ForegroundColor Gray
        Write-Host "Please ensure you're running this from the Revert-Changes folder." -ForegroundColor Yellow
    }
    Write-Host ""
    Write-Host "=====================================================================" -ForegroundColor DarkGray
    exit
}
elseif ($choice -ne '2') {
    Write-Host ""
    Write-Host "    [ERROR] Invalid choice. Exiting." -ForegroundColor Red
    exit
}

Write-Host ""
Write-Host "    ========================================================================" -ForegroundColor Yellow
Write-Host "    |                        COMPLETE REMOVAL MODE                        |" -ForegroundColor Yellow
Write-Host "    ========================================================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "    WARNING: This will completely remove your PowerShell customizations!" -ForegroundColor Yellow
Write-Host "    You'll be asked about each component individually." -ForegroundColor Gray
Write-Host ""

$confirm = Read-Host "    Are you sure you want to continue with complete removal? (y/n)"
if ($confirm -ne 'y') {
    Write-Host ""
    Write-Host "    Operation cancelled. Your customizations remain intact." -ForegroundColor Blue
    exit
}

Write-Host ""
Write-Host "    ========================================================================" -ForegroundColor Red
Write-Host "    |                      STARTING CLEANUP PROCESS                       |" -ForegroundColor Red
Write-Host "    ========================================================================" -ForegroundColor Red
Write-Host ""

Show-RevertProgress "Preparing removal sequence" 1000
Show-RevertProgress "Scanning installed components" 1500

# Function to ask for confirmation with robust input validation
function Ask-Confirmation {
    param($Question, $DefaultYes = $false)
    
    while ($true) {
        if ($DefaultYes) {
            $prompt = "$Question (Y/n)"
        }
        else {
            $prompt = "$Question (y/N)"
        }
        
        $response = Read-Host $prompt
        
        # Require explicit input - no default on empty input
        if ($response -eq '') {
            Write-Host "   Please enter 'y' for yes or 'n' for no." -ForegroundColor Yellow
            continue
        }
        
        # Validate input
        $response = $response.ToUpper()
        if ($response -eq 'Y' -or $response -eq 'YES') {
            return $true
        }
        elseif ($response -eq 'N' -or $response -eq 'NO') {
            return $false
        }
        else {
            Write-Host "   Invalid input. Please enter 'y' for yes or 'n' for no." -ForegroundColor Yellow
        }
    }
}

$itemsRemoved = 0
$totalItems = 7

# 1. Remove custom PowerShell profile
Write-Host ""
Write-Host "[1/7] PowerShell Profile" -ForegroundColor Yellow

# Check for profile in multiple possible locations
$profileLocations = @(
    $PROFILE,
    "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1",
    "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
)

$profilesFound = $false
foreach ($profilePath in $profileLocations) {
    if (Test-Path $profilePath) {
        Write-Host "   Found custom PowerShell profile at: $profilePath" -ForegroundColor White
        $profilesFound = $true
    }
}

if ($profilesFound) {
    if (Ask-Confirmation "   Remove custom PowerShell profile(s)?" $true) {
        foreach ($profilePath in $profileLocations) {
            if (Test-Path $profilePath) {
                Remove-Item $profilePath -Force -ErrorAction SilentlyContinue
                Write-Host "   Removed: $profilePath" -ForegroundColor Green
            }
        }
        
        # Clean up empty profile directories
        $profileDirs = @(
            "$env:USERPROFILE\Documents\WindowsPowerShell",
            "$env:USERPROFILE\Documents\PowerShell"
        )
        
        foreach ($dir in $profileDirs) {
            if ((Test-Path $dir) -and ((Get-ChildItem $dir -Force | Measure-Object).Count -eq 0)) {
                Remove-Item $dir -Force -ErrorAction SilentlyContinue
                Write-Host "   Cleaned up empty directory: $dir" -ForegroundColor Green
            }
        }
        
        $itemsRemoved++
    }
    else {
        Write-Host "   Skipped PowerShell profile removal" -ForegroundColor Blue
    }
}
else {
    Write-Host "   No custom profile found" -ForegroundColor Gray
}

# 2. Remove custom themes
Write-Host ""
Write-Host "[2/7] Custom Themes" -ForegroundColor Yellow
$ompThemesPath = "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes"
$homeThemePath = "$env:USERPROFILE\nordcustom.omp.json"

$themesFound = $false
if (Test-Path "$ompThemesPath\nordcustom.omp.json") {
    Write-Host "   Found theme in Oh My Posh directory" -ForegroundColor White
    $themesFound = $true
}
if (Test-Path $homeThemePath) {
    Write-Host "   Found theme in user directory" -ForegroundColor White
    $themesFound = $true
}

if ($themesFound) {
    if (Ask-Confirmation "   Remove custom Nord theme files?" $true) {
        Remove-Item "$ompThemesPath\nordcustom.omp.json" -Force -ErrorAction SilentlyContinue
        Remove-Item $homeThemePath -Force -ErrorAction SilentlyContinue
        Write-Host "   Removed custom theme files" -ForegroundColor Green
        $itemsRemoved++
    }
    else {
        Write-Host "   Skipped theme removal" -ForegroundColor Blue
    }
}
else {
    Write-Host "   No custom themes found" -ForegroundColor Gray
}

# 3. Uninstall Oh My Posh
Write-Host ""
Write-Host "[3/7]  Oh My Posh" -ForegroundColor Yellow
$omp = Get-Command oh-my-posh -ErrorAction SilentlyContinue
if ($omp) {
    Write-Host "   Oh My Posh is currently installed" -ForegroundColor White
    if (Ask-Confirmation "    Uninstall Oh My Posh completely?") {
        Write-Host "   Uninstalling Oh My Posh..." -ForegroundColor Blue
        winget uninstall JanDeDobbeleer.OhMyPosh --accept-source-agreements | Out-Null
        Write-Host "   Oh My Posh uninstalled" -ForegroundColor Green
        $itemsRemoved++
    }
    else {
        Write-Host "     Keeping Oh My Posh installed" -ForegroundColor Blue
    }
}
else {
    Write-Host "     Oh My Posh is not installed" -ForegroundColor Gray
}

# 4. Uninstall Fastfetch
Write-Host ""
Write-Host "[4/7]  Fastfetch" -ForegroundColor Yellow
$fastfetch = Get-Command fastfetch -ErrorAction SilentlyContinue
if ($fastfetch) {
    Write-Host "   Fastfetch is currently installed" -ForegroundColor White
    if (Ask-Confirmation "  Uninstall Fastfetch?") {
        Write-Host "   Uninstalling Fastfetch..." -ForegroundColor Blue
        winget uninstall fastfetch --accept-source-agreements | Out-Null
        Write-Host "   Fastfetch uninstalled" -ForegroundColor Green
        $itemsRemoved++
    }
    else {
        Write-Host "    Keeping Fastfetch installed" -ForegroundColor Blue
    }
}
else {
    Write-Host "  Fastfetch is not installed" -ForegroundColor Gray
}

# 5. Uninstall ntop (process monitoring tool)
Write-Host ""
Write-Host "[5/8]  ntop (Process Monitoring)" -ForegroundColor Yellow
$ntop = Get-Command ntop -ErrorAction SilentlyContinue
if ($ntop) {
    Write-Host "   ntop is currently installed" -ForegroundColor White
    if (Ask-Confirmation "  Uninstall ntop?") {
        Write-Host "   Uninstalling ntop..." -ForegroundColor Blue
        try {
            winget uninstall ntop --accept-source-agreements | Out-Null
            Write-Host "   ntop uninstalled" -ForegroundColor Green
            $itemsRemoved++
        }
        catch {
            Write-Host "   Failed to uninstall ntop via winget, trying alternative removal..." -ForegroundColor Yellow
            Write-Host "   Please manually remove ntop if needed" -ForegroundColor Gray
        }
    }
    else {
        Write-Host "    Keeping ntop installed" -ForegroundColor Blue
    }
}
else {
    Write-Host "  ntop is not installed" -ForegroundColor Gray
}

# 6. Remove PSReadLine (reset to default)
Write-Host ""
Write-Host "[6/8] PSReadLine Module" -ForegroundColor Yellow

# Check if custom PSReadLine is installed
$psReadLineModule = Get-Module -ListAvailable PSReadLine | Where-Object { $_.ModuleBase -like "*CurrentUser*" }
if ($psReadLineModule) {
    Write-Host "   Custom PSReadLine module found (v$($psReadLineModule.Version))" -ForegroundColor White
    if (Ask-Confirmation "   Remove custom PSReadLine module? (Windows default will remain)") {
        Write-Host "   Removing custom PSReadLine module..." -ForegroundColor Blue
        try {
            # Remove custom installed PSReadLine
            Uninstall-Module PSReadLine -Force -ErrorAction SilentlyContinue
            Write-Host "   Custom PSReadLine module removed (Windows default PSReadLine will be used)" -ForegroundColor Green
            $itemsRemoved++
        }
        catch {
            Write-Host "   Warning: Could not remove PSReadLine module: $($_.Exception.Message)" -ForegroundColor Yellow
            Write-Host "   This is usually not a problem - Windows will use the default version" -ForegroundColor Gray
        }
    }
    else {
        Write-Host "   Keeping custom PSReadLine module" -ForegroundColor Blue
    }
}
else {
    Write-Host "   No custom PSReadLine module found (using Windows default)" -ForegroundColor Gray
}

# 6. Remove Hack Nerd Font
Write-Host ""
Write-Host "[7/8] Hack Nerd Font" -ForegroundColor Yellow

# Check for Hack fonts in user fonts registry
$hackInstalled = Get-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -ErrorAction SilentlyContinue | 
Where-Object { $_.PSObject.Properties.Name -like "*Hack*" }

if ($hackInstalled) {
    Write-Host "   Hack Nerd Font is installed" -ForegroundColor White
    if (Ask-Confirmation "   Remove Hack Nerd Font?") {
        Write-Host "   Removing Hack Nerd Font..." -ForegroundColor Blue
        
        # Remove font files and registry entries
        foreach ($property in $hackInstalled.PSObject.Properties) {
            if ($property.Name -like "*Hack*" -and $property.Name -notmatch "^PS") {
                # Remove font file
                $fontFile = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\$($property.Value)"
                if (Test-Path $fontFile) {
                    Remove-Item $fontFile -Force -ErrorAction SilentlyContinue
                }
                
                # Remove registry entry
                Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name $property.Name -Force -ErrorAction SilentlyContinue
            }
        }
        
        Write-Host "   Hack Nerd Font removed" -ForegroundColor Green
        $itemsRemoved++
    }
    else {
        Write-Host "   Keeping Hack Nerd Font installed" -ForegroundColor Blue
    }
}
else {
    # Check for winget installed Hack fonts as fallback
    $hackFontsWinget = winget list SourceFoundry.HackFonts -e --accept-source-agreements 2>$null
    if ($hackFontsWinget -and ($hackFontsWinget | Select-String "SourceFoundry.HackFonts")) {
        Write-Host "   Regular Hack Fonts found (via winget)" -ForegroundColor White
        if (Ask-Confirmation "   Remove Hack Fonts?") {
            Write-Host "   Uninstalling Hack Fonts..." -ForegroundColor Blue
            winget uninstall SourceFoundry.HackFonts --accept-source-agreements | Out-Null
            Write-Host "   Hack Fonts uninstalled" -ForegroundColor Green
            $itemsRemoved++
        }
        else {
            Write-Host "   Keeping Hack Fonts installed" -ForegroundColor Blue
        }
    }
    else {
        Write-Host "   No Hack fonts found" -ForegroundColor Gray
    }
}

# 7. Restore Windows Terminal settings
Write-Host ""
Write-Host "[8/8] Windows Terminal Settings" -ForegroundColor Yellow

# Function to restore Windows Terminal settings
function Restore-WindowsTerminalConfig {
    try {
        # Find Windows Terminal settings path
        $terminalPackagePath = Get-ChildItem "$env:LOCALAPPDATA\Packages" -Directory | Where-Object { $_.Name -like "*WindowsTerminal*" } | Select-Object -First 1
        
        if (!$terminalPackagePath) {
            return $false
        }
        
        $settingsPath = "$($terminalPackagePath.FullName)\LocalState\settings.json"
        
        if (!(Test-Path $settingsPath)) {
            return $false
        }
        
        # Look for Nick Terminal Manager backup files
        $backupFiles = Get-ChildItem "$($terminalPackagePath.FullName)\LocalState" -Filter "settings.nick-terminal-mgr-backup-*.json" -ErrorAction SilentlyContinue
        
        if ($backupFiles) {
            # Use the most recent backup
            $latestBackup = $backupFiles | Sort-Object LastWriteTime -Descending | Select-Object -First 1
            Write-Host "   Found Nick Terminal Manager backup: $($latestBackup.Name)" -ForegroundColor White
            return @{
                "HasBackup"  = $true
                "BackupPath" = $latestBackup.FullName
            }
        }
        else {
            # Check if our settings are applied
            $settingsContent = Get-Content $settingsPath -Raw -Encoding UTF8
            $settings = $settingsContent | ConvertFrom-Json
            
            $hasCustomDefaults = $false
            
            if ($settings.profiles -and $settings.profiles.defaults) {
                $defaults = $settings.profiles.defaults
                if (($defaults.font -and $defaults.font.face -eq "Hack Nerd Font") -or 
                    ($defaults.opacity) -or 
                    ($defaults.useAcrylic -eq $true)) {
                    $hasCustomDefaults = $true
                }
            }
            
            # Check for window settings
            if (($settings.initialCols -eq 140) -or ($settings.initialRows -eq 45) -or ($settings.centerOnLaunch -eq $true)) {
                $hasCustomDefaults = $true
            }
            
            return @{
                "HasBackup"         = $false
                "HasCustomSettings" = $hasCustomDefaults
            }
        }
    }
    catch {
        return $false
    }
}

$terminalResult = Restore-WindowsTerminalConfig
if ($terminalResult -and ($terminalResult.HasBackup -or $terminalResult.HasCustomSettings)) {
    if ($terminalResult.HasBackup) {
        Write-Host "   Found Nick Terminal Manager backup settings" -ForegroundColor White
    }
    else {
        Write-Host "   Found custom Windows Terminal settings (font/transparency/window)" -ForegroundColor White
    }
    
    if (Ask-Confirmation "   Restore Windows Terminal to previous settings?") {
        Write-Host "   Restoring Windows Terminal settings..." -ForegroundColor Blue
        
        try {
            # Find Windows Terminal settings path
            $terminalPackagePath = Get-ChildItem "$env:LOCALAPPDATA\Packages" -Directory | Where-Object { $_.Name -like "*WindowsTerminal*" } | Select-Object -First 1
            $settingsPath = "$($terminalPackagePath.FullName)\LocalState\settings.json"
            
            if ($terminalResult.HasBackup) {
                # Restore from Nick Terminal Manager backup
                Copy-Item $terminalResult.BackupPath $settingsPath -Force
                Remove-Item $terminalResult.BackupPath -Force -ErrorAction SilentlyContinue
                Write-Host "   Windows Terminal settings restored from Nick Terminal Manager backup" -ForegroundColor Green
            }
            else {
                # No backup found - clear the LocalState folder to reset to defaults
                Write-Host "   No backup found. Resetting Windows Terminal to defaults..." -ForegroundColor Blue
                
                try {
                    $localStatePath = "$($terminalPackagePath.FullName)\LocalState"
                    
                    # Remove all files from LocalState folder
                    Get-ChildItem $localStatePath -File | Remove-Item -Force -ErrorAction Continue
                    
                    Write-Host "   Windows Terminal reset to factory defaults" -ForegroundColor Green
                    Write-Host "   New settings will be generated when you open Windows Terminal" -ForegroundColor Gray
                }
                catch {
                    Write-Host "   Warning: Could not reset Windows Terminal completely: $($_.Exception.Message)" -ForegroundColor Yellow
                    Write-Host "   You may need to manually delete: $localStatePath" -ForegroundColor Gray
                }
            }
            
            $itemsRemoved++
        }
        catch {
            Write-Host "   Warning: Could not restore Windows Terminal settings: $($_.Exception.Message)" -ForegroundColor Yellow
        }
    }
    else {
        Write-Host "   Keeping Windows Terminal settings" -ForegroundColor Blue
    }
}
else {
    Write-Host "   No custom Windows Terminal settings found" -ForegroundColor Gray
}

# Summary
Write-Host ""
Write-Host " Revert process completed!" -ForegroundColor Green
Write-Host ""
Write-Host " Summary:" -ForegroundColor Cyan
Write-Host "    Items removed: $itemsRemoved" -ForegroundColor White
Write-Host "    Items kept: $($totalItems - $itemsRemoved)" -ForegroundColor White
Write-Host ""
if ($itemsRemoved -gt 0) {
    Write-Host " Please restart your PowerShell/terminal to see the changes!" -ForegroundColor Yellow
} 
else {
    Write-Host "  No changes were made to your system." -ForegroundColor Blue
}

# Return to root directory if we're in Scripts folder
if ((Get-Location).Path -like "*\Scripts") {
    Set-Location ".."
}
