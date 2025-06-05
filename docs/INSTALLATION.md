# Claude Code Complete Windows Installation Guide

## Table of Contents
1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Step 1: Enable WSL](#step-1-enable-wsl)
4. [Step 2: Install Ubuntu](#step-2-install-ubuntu)
5. [Step 3: Install Node.js](#step-3-install-nodejs)
6. [Step 4: Install Claude Code](#step-4-install-claude-code)
7. [Step 5: Authentication](#step-5-authentication)
8. [Step 6: First Use](#step-6-first-use)
9. [Troubleshooting](#troubleshooting)
10. [Quick Start Commands](#quick-start-commands)

## Overview

Claude Code is not supported natively on Windows - it requires macOS or Linux. However, you can run it perfectly on Windows using WSL (Windows Subsystem for Linux). This guide will walk you through the entire process.

## Prerequisites

- Windows 10 version 2004+ or Windows 11
- Administrator access to your Windows machine
- Internet connection
- An Anthropic account with subscription

## Step 1: Enable WSL

### Check if WSL is already installed
Open PowerShell and run:
```powershell
wsl --status
```

If you see "Default Version: 2", WSL is partially set up. Skip to Step 2.

### Install WSL (if not already installed)

1. **Open PowerShell as Administrator**
   - Right-click Start button
   - Select "Windows PowerShell (Admin)" or "Terminal (Admin)"

2. **Enable WSL features**
   ```powershell
   dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
   dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
   ```

3. **Restart your computer**

4. **Set WSL 2 as default** (after restart)
   ```powershell
   wsl --set-default-version 2
   ```

## Step 2: Install Ubuntu

### Option A: Command Line Installation (Recommended)
```powershell
wsl --install -d Ubuntu
```

### Option B: Microsoft Store Installation
1. Open Microsoft Store
2. Search for "Ubuntu"
3. Install "Ubuntu" (the main one, not a specific version)
4. Launch it after installation

### First Time Ubuntu Setup
When Ubuntu first runs:
1. It will take a few minutes to set up
2. Create a username (can be different from Windows username)
3. Create a password (you'll need this for sudo commands)
4. Remember these credentials!

## Step 3: Install Node.js

Once Ubuntu is running, install Node.js:

1. **Update package lists**
   ```bash
   sudo apt update
   ```

2. **Add NodeSource repository**
   ```bash
   curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
   ```

3. **Install Node.js**
   ```bash
   sudo apt-get install -y nodejs
   ```

4. **Verify installation**
   ```bash
   node --version
   npm --version
   ```
   You should see version numbers (e.g., v22.16.0 and 10.9.2)

## Step 4: Install Claude Code

1. **Install Claude Code globally**
   ```bash
   sudo npm install -g @anthropic-ai/claude-code
   ```

2. **Create symlink for the claude command**
   ```bash
   sudo ln -s /usr/lib/node_modules/@anthropic-ai/claude-code/cli.js /usr/local/bin/claude
   sudo chmod +x /usr/local/bin/claude
   ```

3. **Add to PATH (if needed)**
   ```bash
   export PATH="/usr/local/bin:$PATH"
   echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
   source ~/.bashrc
   ```

4. **Verify installation**
   ```bash
   claude --version
   ```

## Step 5: Authentication

Claude Code needs to authenticate with your Anthropic subscription. WSL can't open browsers directly, but here's how to work around it:

1. **Start authentication**
   ```bash
   claude auth login
   ```

2. **Copy the URL**
   - Claude will display a URL like: `https://console.anthropic.com/auth/...`
   - Copy this entire URL

3. **Open in Windows browser**
   - Paste the URL into your Windows browser (Chrome, Edge, etc.)
   - Complete the authentication in your browser
   - You'll be redirected to a success page

4. **Return to WSL**
   - The terminal should automatically detect the successful authentication
   - You're now logged in!

## Step 6: First Use

### Recommended: Change to a safe directory
```bash
# Navigate to your Windows Documents folder
cd /mnt/c/Users/$(cmd.exe /c echo %USERNAME% 2>/dev/null | tr -d '\r')/Documents

# Or create a dedicated workspace
mkdir -p /mnt/c/ClaudeWorkspace
cd /mnt/c/ClaudeWorkspace
```

### Test Claude Code
```bash
# Simple test
claude "Hello, can you confirm you're working?"

# Create a file
claude "Create a simple hello world Python script"
```

## Troubleshooting

### Issue: "claude: command not found"
**Solution:**
```bash
# Check if cli.js exists
ls /usr/lib/node_modules/@anthropic-ai/claude-code/cli.js

# If yes, create alias
echo 'alias claude="node /usr/lib/node_modules/@anthropic-ai/claude-code/cli.js"' >> ~/.bashrc
source ~/.bashrc
```

### Issue: WSL closes immediately
**Solution:**
1. Make sure virtualization is enabled in BIOS
2. Run Windows Update
3. Try: `wsl --update`

### Issue: Permission denied during npm install
**Solution:** Always use `sudo` for global npm installs:
```bash
sudo npm install -g @anthropic-ai/claude-code
```

### Issue: Can't navigate outside current directory
**Solution:** Launch Claude from a user directory, not system directories:
```bash
cd ~  # or cd /mnt/c/Users/YourUsername
claude
```

## Quick Start Commands

Save this as a batch file (`claude-start.bat`) on your Windows desktop:
```batch
@echo off
echo Starting Claude Code in WSL...
wsl -e bash -c "cd /mnt/c/Users/%USERNAME%/Documents && claude"
```

Or add this function to your `~/.bashrc` in WSL:
```bash
# Quick Claude Code launcher
claude-work() {
    cd /mnt/c/Users/$(cmd.exe /c echo %USERNAME% 2>/dev/null | tr -d '\r')/Documents
    claude "$@"
}
```

## Important Notes

1. **Always launch from user directories** - Never from C:\Windows\system32
2. **Windows files are at /mnt/c** in WSL
3. **Use `sudo` for system commands** in Ubuntu
4. **Line endings differ** between Windows (CRLF) and Linux (LF)
5. **Performance is best** with files in the Linux filesystem, but Windows access is easier via /mnt/c

## Next Steps

1. Read the security best practices guide
2. Set up your development workspace
3. Configure git in WSL if needed
4. Explore Claude Code's capabilities

## Getting Help

- Claude Code issues: https://github.com/anthropics/claude-code/issues
- WSL documentation: https://docs.microsoft.com/windows/wsl
- In Claude: use `/help` command

---

Congratulations! You now have Claude Code running on Windows through WSL! 🎉