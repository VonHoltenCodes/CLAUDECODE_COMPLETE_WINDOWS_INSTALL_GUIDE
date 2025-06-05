# Claude Code on Windows - Complete Setup Guide

## Overview
Claude Code is installed in WSL2 (Windows Subsystem for Linux) Ubuntu 24.04 on your system. This guide covers everything you need to know about using Claude Code on Windows.

> **Need to install Claude Code?** See [CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE.md](CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE.md) for step-by-step installation instructions.

## Current Installation Details
- **WSL Distribution**: Ubuntu 24.04.2 LTS
- **WSL Version**: WSL2
- **Claude Code Location**: `/usr/lib/node_modules/@anthropic-ai/claude-code/`
- **User**: traxx
- **Host Machine**: VonHolten308

## How to Launch Claude Code

### Method 1: From Windows Terminal/PowerShell (Recommended)
```bash
# Open Windows Terminal or PowerShell
wsl claude

# Or if you need to authenticate first:
wsl claude auth login
```

### Method 2: From Command Prompt
```cmd
wsl claude
```

### Method 3: From within WSL Ubuntu
```bash
# First enter WSL
wsl

# Then run claude from your home directory
cd ~
claude
```

## Important Security Considerations

### Directory Restrictions
When Claude Code is launched from Windows directories (like system32), it has security restrictions:
- Can only access child directories of where it was launched
- Cannot navigate to parent directories or other system locations
- This is a security feature to protect your Windows system

### Best Practices for Safe Usage
1. **Always launch Claude Code from your project directory** or user folder, not from system directories
2. **Recommended launch location**: 
   ```bash
   cd C:\Users\[YourUsername]\Documents
   wsl claude
   ```
3. **Avoid launching from**:
   - C:\Windows\system32
   - C:\Program Files
   - Other system directories

## Working with Files Between Windows and WSL

### Windows Drive Access in WSL
- C: drive → `/mnt/c`
- D: drive → `/mnt/d`
- Your Windows user folder → `/mnt/c/Users/[YourUsername]`

### File Path Examples
```bash
# Windows path: C:\Users\traxx\Documents\project
# WSL path: /mnt/c/Users/traxx/Documents/project

# Windows path: D:\Development\myapp
# WSL path: /mnt/d/Development/myapp
```

## Claude Code Capabilities on Windows

### What Claude Code CAN do:
- Read and edit files in your project directories
- Create new files and folders
- Run commands through WSL
- Access Windows files through /mnt/c, /mnt/d, etc.
- Execute development tools installed in WSL
- Use git and other version control systems
- Run build scripts and development servers

### What Claude Code CANNOT do:
- Modify Windows system files (when proper security is in place)
- Access directories outside the launch directory (security feature)
- Run Windows-specific executables directly (must use WSL tools)
- Make changes to Windows registry
- Install Windows software (can only install Linux packages in WSL)

## Quick Command Reference

### Essential Commands
```bash
# Check Claude Code version
wsl claude --version

# Get help
wsl claude --help

# Start in a specific directory
cd C:\Users\traxx\Documents && wsl claude

# Update Claude Code (run within WSL)
wsl -e bash -c "npm update -g @anthropic-ai/claude-code"
```

### WSL Management Commands
```bash
# List WSL distributions
wsl --list --verbose

# Shutdown WSL
wsl --shutdown

# Access WSL Ubuntu directly
wsl

# Run specific commands in WSL
wsl [command]
```

## Troubleshooting

### If Claude Code won't start:
1. Make sure WSL is running: `wsl --list --running`
2. Try restarting WSL: `wsl --shutdown` then try again
3. Check if claude is installed: `wsl which claude`

### If you get permission errors:
- You're likely in a system directory
- Close Claude Code and relaunch from a user directory

### If file edits don't appear in Windows:
- Make sure you're editing files in /mnt/c or other mounted drives
- Files created in WSL's filesystem (outside /mnt) won't appear directly in Windows

## Recommended Workflow

1. **Create a development folder** in Windows:
   ```
   C:\Users\traxx\Development
   ```

2. **Always launch Claude Code from there**:
   ```bash
   cd C:\Users\traxx\Development
   wsl claude
   ```

3. **Use Windows tools** (VS Code, browsers) alongside Claude Code

4. **Keep projects** in Windows filesystem (/mnt/c) for easy access from both Windows and WSL

## Additional Notes

- Claude Code runs in Linux environment even though you're on Windows
- File permissions might behave differently than pure Windows
- Line endings: Be aware of CRLF (Windows) vs LF (Linux) differences
- Performance is best when working with files in WSL2's virtual disk, but Windows access is easier through /mnt/c

## Getting Help

- In Claude Code: Use `/help` command
- Report issues: https://github.com/anthropics/claude-code/issues
- This guide location: C:\Windows\system32\CLAUDECODE_WINDOWS_SETUP.md