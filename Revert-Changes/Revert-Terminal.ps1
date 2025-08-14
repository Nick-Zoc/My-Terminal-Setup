# Revert-Terminal.ps1

Write-Host "⚠️  This will revert your PowerShell terminal setup to default." -ForegroundColor Yellow
$confirm = Read-Host "Are you sure you want to continue? (y/n)"
if ($confirm -ne 'y') {
    Write-Host "❌ Cancelled."
    exit
}

# Remove custom PowerShell profile if exists
if (Test-Path $PROFILE) {
    Remove-Item $PROFILE -Force
    Write-Host "🧹 Removed custom PowerShell profile."
} else {
    Write-Host "ℹ️ No profile file found."
}

# Optionally remove oh-my-posh themes
$ompThemesPath = "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes"
if (Test-Path $ompThemesPath) {
    Remove-Item "$ompThemesPath\nordcustom.omp.json" -Force -ErrorAction SilentlyContinue
    Write-Host "🧹 Removed custom oh-my-posh theme."
}

# Uninstall oh-my-posh (optional)
$omp = Get-Command oh-my-posh -ErrorAction SilentlyContinue
if ($omp) {
    Write-Host "Do you want to uninstall oh-my-posh? (y/n)"
    $ompConfirm = Read-Host
    if ($ompConfirm -eq 'y') {
        winget uninstall JanDeDobbeleer.OhMyPosh
    }
}

# Suggest restart
Write-Host "`n✅ Revert complete. Restart your terminal to see changes." -ForegroundColor Green
