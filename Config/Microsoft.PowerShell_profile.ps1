# My Terminal Setup - PowerShell Profile
# This profile provides a beautiful terminal experience with Oh My Posh themes and useful aliases
# It safely checks for command availability before trying to use them

# Configure PSReadLine for enhanced autocomplete and suggestions
if (Get-Module -ListAvailable PSReadLine) {
    Import-Module PSReadLine
    
    # Enhanced intellisense and autocomplete
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle InlineView
    Set-PSReadLineOption -EditMode Emacs
    
    # Enhanced key bindings
    Set-PSReadLineKeyHandler -Key Tab -Function Complete
    Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function DeleteChar
    Set-PSReadLineKeyHandler -Key "Ctrl+w" -Function BackwardDeleteWord
    Set-PSReadLineKeyHandler -Key "Alt+d" -Function DeleteWord
    Set-PSReadLineKeyHandler -Key "Ctrl+LeftArrow" -Function BackwardWord
    Set-PSReadLineKeyHandler -Key "Ctrl+RightArrow" -Function ForwardWord
    
    # History navigation
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    
    # Colors for suggestions
    Set-PSReadLineOption -Colors @{
        Command          = 'Yellow'
        Parameter        = 'Green'
        Operator         = 'Magenta'
        Variable         = 'Green'
        String           = 'Blue'
        Number           = 'Blue'
        Type             = 'Cyan'
        Comment          = 'DarkCyan'
        InlinePrediction = 'DarkGray'
    }
}

# Initialize Oh My Posh if available
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    if (Test-Path "$HOME\nordcustom.omp.json") {
        oh-my-posh init pwsh --config "$HOME\nordcustom.omp.json" | Invoke-Expression
    }
}

# Run fastfetch if available
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch
}

# Custom PowerShell aliases
Set-Alias ll Get-ChildItem
# ".." is a directory, not a valid alias - use a function instead:
function .. { Set-Location .. }

# Only set alias if not already defined
if (-not (Test-Path alias:grep)) { Set-Alias grep Select-String }
# Process monitoring aliases
if (-not (Test-Path alias:top)) { 
    if (Get-Command ntop -ErrorAction SilentlyContinue) {
        Set-Alias top ntop 
    }
}
if (-not (Test-Path alias:htop)) { 
    if (Get-Command ntop -ErrorAction SilentlyContinue) {
        Set-Alias htop ntop 
    }
}
if (-not (Test-Path alias:fetch)) { 
    if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
        Set-Alias fetch fastfetch 
    }
}


