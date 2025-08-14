oh-my-posh init pwsh --config "$HOME\nordcustom.omp.json" | Invoke-Expression
fastfetch
# Custom PowerShell aliases
Set-Alias ll Get-ChildItem
Set-Alias la "Get-ChildItem -Force"
# ".." is a directory, not a valid alias - use a function instead:
function .. { Set-Location .. }
function la { Get-ChildItem -Force }

# Only set alias if not already defined
if (-not (Test-Path alias:grep)) { Set-Alias grep Select-String }
if (-not (Test-Path alias:top)) { Set-Alias top ntop }
if (-not (Test-Path alias:fetch)) { Set-Alias fetch fastfetch }


