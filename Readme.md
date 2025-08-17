# 🚀 PowerShell Theme Manager v3.0

<div align="center">

![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-3.0-blue.svg?style=for-the-badge)

**Professional PowerShell Terminal Enhancement Suite**

*Complete terminal transformation with advanced features, modern aesthetics, and productivity tools*

</div>

---

## 📸 **Visual Preview**

<!-- Main Screenshot -->
![Main Terminal Interface](https://github.com/user-attachments/assets/64d22454-9d84-4578-8651-c81aba94044a)
*PowerShell terminal with Oh My Posh Nord theme, custom prompt, and enhanced features*

<!-- Side-by-side screenshots using HTML table -->
<table>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/998f5aa9-f439-4f74-9955-f1d386e52cde" width="100%"/>
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/c6ce0a53-85e7-4d49-9448-b1ffa1581e1e" width="100%"/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <em>Terminal Manager main interface with setup, fix, and removal options</em>
    </td>
    <td align="center">
      <em>Dynamic installation progress with real-time status updates and color-coded messages</em>
    </td>
  </tr>
</table>

---



## 💻 **System Requirements**

### **Operating System**
- **Windows 10** (basic features, no acrylic blur)
- **Windows 11** (full feature support including acrylic blur effects)

### **PowerShell**
- **Primary Target**: PowerShell 5.1 (built-in Windows PowerShell)
- **⚠️ PowerShell 7+**: May work but **not extensively tested** - install separately in PowerShell 7+ window
- **Note**: Script automatically detects PowerShell version and adapts accordingly

### **Dependencies**

- **Execution Policy to 'Remote Signed'** (See steps below, MANDATORY)
- **Winget Package Manager** (Windows 10 1709+ / Windows 11)
- **Internet Connection** (for initial component downloads)
- **Administrator Privileges** (for system-wide font installation)

---


## 🚀 **Installation Methods**

## ⚠️ Before any of it RUN this: ⚠️
### Run this command in PowerShell as ADMINISTRATOR:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### **Method 1: One-Line Installation** ⚡ (Recommended)
```powershell
iwr -useb "https://raw.githubusercontent.com/Nick-Zoc/My-Terminal-Setup/main/One-Line-Setups/install.ps1" | iex
```

### **Method 2: Git Clone Installation** 🔄
```powershell
git clone https://github.com/Nick-Zoc/My-Terminal-Setup.git
cd My-Terminal-Setup
.\Terminal-Manager.ps1
```

### **Method 3: Manual Download & Run** 📁
1. Download from [GitHub Repository](https://github.com/Nick-Zoc/My-Terminal-Setup)
2. Extract ZIP and run `Terminal-Manager.ps1`

---

## 🎯 **Core Features**

| Component | Description | Status |
|-----------|-------------|--------|
| **Oh My Posh** | Powerline prompt with Git integration | ✅ Auto-Install |
| **Fastfetch** | System information display | ✅ Auto-Install |
| **ntop** | Process monitoring (top/htop aliases) | ✅ Auto-Install |
| **PSReadLine** | Advanced autocomplete & suggestions | ✅ Auto-Install |
| **Hack Nerd Font** | Programming font with icons | ✅ Auto-Install |
| **Windows Terminal** | Transparency & font configuration | ✅ Auto-Install |

### **⚠️ PowerShell 7+ Compatibility Note**
Most features are designed for PowerShell 5.1. While the script may work in PowerShell 7+, it has not been extensively tested and some features may not function as expected.

---

## 🎮 **Terminal Manager Options**

```
┌─────────────────────────────────────────────────────────────┐
│  1. Install PowerShell Setup (Full Installation)           │
│     - Oh My Posh, Fastfetch, ntop, PSReadLine, Hack Font   │
│     - Nord theme & PowerShell profile                      │
│                                                             │
│  2. Fix Profile Errors (Quick Fix)                         │
│     - Fixes 'command not found' errors                     │
│     - Keeps customizations intact                          │
│                                                             │
│  3. Complete Removal                                        │
│     - Removes all customizations                           │
│     - Returns to default PowerShell                        │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔧 **Component Details**

### **Oh My Posh**
Modern prompt theme engine with Git integration  
*Credit: [Jan De Dobbeleer](https://github.com/JanDeDobbeleer/oh-my-posh)*

### **Fastfetch**
Cross-platform system information tool (triggered via `fetch` alias)

### **ntop**
Process monitoring tool (available through `top` and `htop` aliases)

### **PSReadLine**
Advanced command-line editing with InlineView autocomplete  
**⚠️ Note**: Optimized for PowerShell 5.1, may not work properly in PowerShell 7+

### **Windows Terminal Integration**
Background transparency (30%), acrylic blur effects (Windows 11 only), custom fonts

### **Hack Nerd Font**
Programming-focused font with 3,000+ icons and programming ligatures

---

## 🛠️ **Custom Aliases**

| Alias | Command | Description |
|-------|---------|-------------|
| `ll` | `Get-ChildItem -Force` | List all files including hidden |
| `..` | `cd ..` | Navigate to parent directory |
| `grep` | `Select-String` | Search text patterns in files |
| `top` | `ntop` | Process monitoring (requires ntop) |
| `htop` | `ntop` | Alternative process monitor |
| `fetch` | `fastfetch` | Display system information |

---

## 🛠️ **Troubleshooting**

### **Common Issues**

**"Command not found" errors**
- Solution: Run Terminal Manager → Option 2 (Fix Profile Errors)

**Windows Terminal transparency not working**
- Cause: Feature requires Windows 11 for acrylic blur effects

**Font not displaying correctly**
- Solution: Restart terminal and manually select "Hack Nerd Font Mono"

**Installation fails with permission errors**
- Solution: Run PowerShell as Administrator

## 🛡️ **Execution Policy Requirements**

### **Common Issue: "Execution of scripts is disabled"**
If you encounter execution policy errors, use one of these solutions:


### **Solution :** 🔧
Run this command in PowerShell as Administrator:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### **Manual Removal**
```powershell
winget uninstall JanDeDobbeleer.OhMyPosh
winget uninstall fastfetch
winget uninstall ntop
winget uninstall SourceFoundry.HackFonts
Remove-Item $PROFILE -Force
```

---

## 📝 **Credits & Acknowledgments**

### **Theme & Tools**
- **[Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh)** by [Jan De Dobbeleer](https://github.com/JanDeDobbeleer)
- **[Nord Theme](https://github.com/nordtheme)** by [AntonRyadovoy](https://github.com/AntonRyadovoy/Powershell-nord-theme)
- **[Fastfetch](https://github.com/fastfetch-cli/fastfetch)** - System information tool
- **[ntop](https://github.com/gsauthof/ntop)** - Process monitoring utility
- **[Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts)** by [Ryan L McIntyre](https://github.com/ryanoasis)
- **[PowerShell Team](https://github.com/PowerShell/PowerShell)** - PowerShell platform
- **[Windows Terminal Team](https://github.com/microsoft/terminal)** - Modern terminal application

---

## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**Third-Party Licenses**: All integrated tools retain their respective licenses.

---

## 🔄 **Version Information**

**Current Version**: 3.0.0  
**Release Date**: August 17 2025  
**Compatibility**: PowerShell 5.1+ (⚠️ PowerShell 7+ not extensively tested)  
**Status**: Stable Release

For detailed changelog, see [release.md](release.md)

---

<div align="center">

**Transform your PowerShell experience today!**

[🚀 One-Line Install](https://raw.githubusercontent.com/Nick-Zoc/My-Terminal-Setup/main/One-Line-Setups/install.ps1) | [📁 Download](https://github.com/Nick-Zoc/My-Terminal-Setup/archive/refs/heads/main.zip) | [🔄 Git Clone](https://github.com/Nick-Zoc/My-Terminal-Setup.git)

</div>
