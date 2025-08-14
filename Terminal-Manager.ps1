# Nick Zoc's PowerShell Theme Manager - All-in-One Setup & Revert Tool
# This single script can install, fix errors, or completely remove the terminal setup
# Usage: iwr -useb "https://raw.githubusercontent.com/NickZoc/My-Terminal-Setup/main/Terminal-Manager.ps1" | iex

Clear-Host

# Cool Tech-Themed ASCII Art Header (Windows/Terminal Icons)
Write-Host ""
Write-Host "    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" -ForegroundColor Cyan
Write-Host "    ||                                                                                                ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############                         /#\                       ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############                        /###\                      ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############                       /#####\                     ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############                      /#######\                    ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############                     /#########\                   ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############                    /##=,_\#####\                  ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############                   /#############\                 ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############                  /###############\                ||  " -ForegroundColor Cyan
Write-Host "    ||                                                              /#################\               ||  " -ForegroundColor Cyan
Write-Host "    ||                                                             /###################\              ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############               /######*\#\#\#\#\#####\             ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############              /#######/       \#######\            ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############             /########         ########\           ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############            /#########         #########\          ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############           /##########         ##########\         ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############          /######***             ***######\        ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############         /###**                       **###\       ||  " -ForegroundColor Cyan
Write-Host "    ||     ###############          ###############        /**                              **\\      ||   " -ForegroundColor Cyan
Write-Host "    ||                                                                                                ||" -ForegroundColor Cyan
Write-Host "    ||                                                                 I use ARCH btw.                ||" -ForegroundColor Green
Write-Host "    ||                                                                                                ||" -ForegroundColor Cyan
Write-Host "    ||                                            NICK ZOC'S                                          ||" -ForegroundColor Cyan
Write-Host "    ||                                     POWERSHELL THEME MANAGER                                   ||" -ForegroundColor Cyan
Write-Host "    ||                                                                                                ||" -ForegroundColor Cyan
Write-Host "    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" -ForegroundColor Cyan
Write-Host ""
Write-Host "    ====================================================================================================" -ForegroundColor Cyan
Write-Host "    |                                            POWERSHELL MANAGER                                    |" -ForegroundColor White
Write-Host "    |                                      Setup | Fix | Remove | Manage                               |" -ForegroundColor White
Write-Host "    ====================================================================================================" -ForegroundColor Cyan
Write-Host ""

# Hacker-style initialization sequence with animated progress
function Show-SmoothInitialization {
    
    $loadingSteps = @(
        "Scanning system architecture",
        "Ensuring security protocols", 
        "Accessing terminal matrix",
        "Loading Kernel Drivers",
        "Establishing secure connection"
    )
    
    # Hacker-style animated progress bar
    $progressChars = @('|', '/', '-', '\')
    
    for ($i = 0; $i -lt $loadingSteps.Length; $i++) {
        Write-Host "    [$(Get-Date -Format "HH:mm:ss")] $($loadingSteps[$i])..." -ForegroundColor Gray -NoNewline
        
        # Animated spinning progress with green theme
        for ($spin = 0; $spin -lt 12; $spin++) {
            $char = $progressChars[$spin % 4]
            Write-Host " [$char]" -ForegroundColor Green -NoNewline
            Start-Sleep -Milliseconds 125  # 12 * 125ms = 1.5 seconds total
            Write-Host "`b`b`b`b" -NoNewline  # Backspace to overwrite
        }
        
        Write-Host " [OK]" -ForegroundColor Green
        Start-Sleep -Milliseconds 150
    }
    
    Write-Host ""
    Write-Host "    ========================================================================" -ForegroundColor Green
    Write-Host "    |                     SCRIPT INITIALIZED!                              |" -ForegroundColor Green
    Write-Host "    ========================================================================" -ForegroundColor Green
    Write-Host ""
    Start-Sleep -Milliseconds 500
}

# Call the smooth initialization
Show-SmoothInitialization

Write-Host "    Choose your action:" -ForegroundColor White
Write-Host ""
Write-Host "    ----------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    |  1. Install Terminal Setup (Full Installation)               |" -ForegroundColor Green
Write-Host "    |     - Oh My Posh, Fastfetch, Hack Nerd Font                  |" -ForegroundColor Gray
Write-Host "    |     - Custom Nord theme & PowerShell profile                 |" -ForegroundColor Gray
Write-Host "    |     - Beautiful animated installation                        |" -ForegroundColor Gray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    |  2. Fix Profile Errors (Recommended for errors)              |" -ForegroundColor Yellow
Write-Host "    |     - Fixes 'command not found' errors                       |" -ForegroundColor Gray
Write-Host "    |     - Keeps all customizations intact                        |" -ForegroundColor Gray
Write-Host "    |     - Quick and safe solution                                |" -ForegroundColor Gray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    |  3. Complete Removal (Nuclear option)                        |" -ForegroundColor Red
Write-Host "    |     - Removes all terminal customizations                    |" -ForegroundColor Gray
Write-Host "    |     - Uninstalls Oh My Posh, Fastfetch, etc.                 |" -ForegroundColor Gray
Write-Host "    |     - Returns to default PowerShell                          |" -ForegroundColor Gray
Write-Host "    |                                                              |" -ForegroundColor DarkGray
Write-Host "    ----------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""
Write-Host "    =====================================================================" -ForegroundColor DarkGray

$choice = Read-Host "    Choose option (1=Install, 2=Fix, 3=Remove, q=Quit)"

if ($choice -eq 'q') {
    Write-Host ""
    Write-Host "    Operation cancelled. Have a great day!" -ForegroundColor Blue
    exit
}

# Work with local files - no need to download
$scriptDir = $PSScriptRoot
Write-Host ""
Write-Host "    Working with local files..." -ForegroundColor Cyan

try {
    # Execute based on user choice
    switch ($choice) {
        '1' {
            Write-Host ""
            Write-Host "    ================================================================" -ForegroundColor Green
            Write-Host "    |                    STARTING INSTALLATION                      |" -ForegroundColor Green
            Write-Host "    ================================================================" -ForegroundColor Green
            Write-Host ""
            
            # Run the main setup script from local Scripts directory
            Set-Location "$scriptDir\Scripts"
            & ".\Setup-Terminal.ps1"
        }
        '2' {
            Write-Host ""
            Write-Host "    ================================================================" -ForegroundColor Yellow
            Write-Host "    |                      FIXING PROFILE ERRORS                    |" -ForegroundColor Yellow
            Write-Host "    ================================================================" -ForegroundColor Yellow
            Write-Host ""
            
            # Hacker-style repair sequence
            function Show-RepairSequence {
                Write-Host "    ========================================================================" -ForegroundColor Yellow
                Write-Host "    |                      INITIALIZING REPAIR MODE                       |" -ForegroundColor Yellow
                Write-Host "    ========================================================================" -ForegroundColor Yellow
                Write-Host ""
                
                $repairSteps = @(
                    "Scanning profile corruption",
                    "Analyzing error patterns", 
                    "Preparing repair toolkit",
                    "Executing profile fix"
                )
                
                # Hacker-style animated progress
                $progressChars = @('|', '/', '-', '\')
                
                for ($i = 0; $i -lt $repairSteps.Length; $i++) {
                    Write-Host "    [$(Get-Date -Format "HH:mm:ss")] $($repairSteps[$i])..." -ForegroundColor Gray -NoNewline
                    
                    # Animated spinning progress with yellow theme
                    for ($spin = 0; $spin -lt 12; $spin++) {
                        $char = $progressChars[$spin % 4]
                        Write-Host " [$char]" -ForegroundColor Yellow -NoNewline
                        Start-Sleep -Milliseconds 125
                        Write-Host "`b`b`b`b" -NoNewline  # Backspace to overwrite
                    }
                    
                    Write-Host " [OK]" -ForegroundColor Green
                    Start-Sleep -Milliseconds 100
                }
                
                Write-Host ""
                Write-Host "    ========================================================================" -ForegroundColor Yellow
                Write-Host "    |                     REPAIR MODE ACTIVATED!                          |" -ForegroundColor Yellow
                Write-Host "    ========================================================================" -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -Milliseconds 300
            }
            
            # Show the repair sequence
            Show-RepairSequence
            
            # Apply the fixed profile from local Config directory
            $fixedProfile = "$scriptDir\Config\Microsoft.PowerShell_profile.ps1"
            if (Test-Path $fixedProfile) {
                $profileDir = Split-Path -Parent $PROFILE
                if (!(Test-Path $profileDir)) {
                    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
                }
                
                Write-Host "    Applying error-safe profile configuration..." -ForegroundColor Blue
                Copy-Item -Path $fixedProfile -Destination $PROFILE -Force
                
                Write-Host ""
                Write-Host "    [SUCCESS] PowerShell profile fixed successfully!" -ForegroundColor Green
                Write-Host ""
                Write-Host "    Please restart your terminal to see the changes." -ForegroundColor Yellow
                Write-Host "    Your customizations are preserved - errors should be gone!" -ForegroundColor Gray
            }
            else {
                Write-Host "    [ERROR] Could not find the fixed profile file." -ForegroundColor Red
            }
        }
        '3' {
            Write-Host ""
            Write-Host "    ================================================================" -ForegroundColor Red
            Write-Host "    |                        COMPLETE REMOVAL                       |" -ForegroundColor Red
            Write-Host "    ================================================================" -ForegroundColor Red
            Write-Host ""
            
            # Run the revert script from local Scripts directory
            Set-Location "$scriptDir\Scripts"
            & ".\Revert-Terminal.ps1"
        }
        default {
            Write-Host ""
            Write-Host "    [ERROR] Invalid choice. Please run the script again." -ForegroundColor Red
        }
    }
}
catch {
    Write-Host ""
    Write-Host "    [ERROR] Failed to execute: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "    Please check file permissions and try again." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "    ========================================================================" -ForegroundColor Blue
Write-Host "    |                    Thanks for using PowerShell Theme Manager!      |" -ForegroundColor Blue
Write-Host "    ========================================================================" -ForegroundColor Blue
