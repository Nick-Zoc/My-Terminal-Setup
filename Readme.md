# 💻 My-Terminal-Setup

A clean and beautiful PowerShell terminal setup for Windows users — complete with custom themes, aliases, productivity tools, and a fast reinstallation script.

---

## ✨ Features

- ⚡ **Oh My Posh** with custom Nord-based theme
- 💾 Fastfetch for system info on launch
- 📊 `ntop`/`htop`-like terminal process viewer
- 🧠 Handy aliases & functions for productivity
- 🔎 `fzf` for fast fuzzy search (optional)
- 🖋️ Nerd Fonts & clean font rendering
- 🛠️ Simple one-command reinstall after a format or PC change

---

## 🛠️ Installation

> Prerequisites: **Windows**, [PowerShell 7+](https://github.com/PowerShell/PowerShell), and internet access.

```powershell
git clone https://github.com/yourusername/My-Terminal-Setup
cd My-Terminal-Setup
Set-ExecutionPolicy Bypass -Scope Process -Force
.\Setup-Terminal.ps1


Then restart your terminal.

✅ Done.

🧾 What It Installs

Oh My Posh (prompt theme engine)

fastfetch (system info summary)

ntop (like htop for Windows)

fzf (optional: fuzzy finder)

Hack Nerd Font (for icons & UI)

Custom PowerShell profile with:

Useful aliases (ll, la, gs, fetch, top, ..)

Theme auto-load on start

🎨 Theme Credit

This setup uses a modified Nord theme from Oh My Posh, customized to match a clean dark aesthetic with clear powerline glyphs and icons.

👤 Theme Credit: Jan De Dobbeleer – Creator of Oh My Posh

📸 Preview

💾 Backup Friendly

After every system reset or PC change:

git clone https://github.com/yourusername/My-Terminal-Setup
cd My-Terminal-Setup
.\Setup-Terminal.ps1


That’s it. Your terminal is back.

---

## 🔄 Reverting to Default

To undo all changes and restore your terminal to default:

***(Assuming You are in /My-Terminal_setup/)***

cd Revert-Changes
Set-ExecutionPolicy Bypass -Scope Process -Force
.\Revert-Terminal.ps1