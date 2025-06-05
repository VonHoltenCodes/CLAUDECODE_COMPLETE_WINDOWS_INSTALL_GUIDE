# Claude Code Complete Windows Installation Guide

A comprehensive guide for installing and using Claude Code on Windows through WSL (Windows Subsystem for Linux).

## 🚀 Quick Start

If you just want to get Claude Code running on Windows:

1. **Install WSL**: `wsl --install` (in PowerShell as Admin)
2. **Install Ubuntu**: `wsl --install -d Ubuntu`
3. **Install Node.js**: `curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -`
4. **Install Claude Code**: `sudo npm install -g @anthropic-ai/claude-code`
5. **Authenticate**: `claude auth login` (copy URL to browser)

## 📚 Complete Documentation

This repository contains comprehensive guides for every aspect of Claude Code on Windows:

### Installation & Setup
- [Complete Installation Guide](docs/INSTALLATION.md) - Step-by-step installation process
- [Quick Reference](docs/QUICK_REFERENCE.md) - Essential commands and shortcuts
- [Troubleshooting Guide](docs/TROUBLESHOOTING.md) - Common issues and solutions

### Configuration & Usage
- [Windows Setup Guide](docs/WINDOWS_SETUP.md) - Daily usage and configuration
- [Security Best Practices](docs/SECURITY.md) - Keep your system safe
- [Capabilities & Limitations](docs/CAPABILITIES.md) - What Claude Code can and cannot do

### Development Setup
- [GitHub SSH Setup](docs/GITHUB_SSH.md) - Configure Git and SSH for GitHub
- [WSL Git & GitHub Guide](docs/WSL_GIT_GITHUB_GUIDE.md) - Handle WSL-specific git issues and permissions

## 🎯 Key Points for Windows Users

### ⚠️ Critical: Launch Location Matters!

**Never launch Claude Code from system directories:**
```bash
# ❌ BAD - Severely limited capabilities
C:\Windows\system32> wsl claude

# ✅ GOOD - Full capabilities
C:\Users\YourName\Documents> wsl claude
```

### 🔑 Essential Concepts

1. **Claude Code runs in Linux** (WSL), not native Windows
2. **Windows files** are accessible at `/mnt/c/` in WSL
3. **The command is `claude`**, not `claude-code`
4. **Browser authentication** requires manual URL copy/paste
5. **Use `sudo`** for system operations in WSL

## 🛠️ Installation Overview

### Prerequisites
- Windows 10 version 2004+ or Windows 11
- Administrator access
- Internet connection
- Anthropic account with subscription

### Installation Steps

1. **Enable WSL**
   ```powershell
   # PowerShell (Admin)
   wsl --install
   ```

2. **Install Ubuntu**
   ```powershell
   wsl --install -d Ubuntu
   ```

3. **Install Node.js** (in WSL/Ubuntu)
   ```bash
   curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
   sudo apt-get install -y nodejs
   ```

4. **Install Claude Code**
   ```bash
   sudo npm install -g @anthropic-ai/claude-code
   ```

5. **Set up the `claude` command**
   ```bash
   sudo ln -s /usr/lib/node_modules/@anthropic-ai/claude-code/cli.js /usr/local/bin/claude
   ```

6. **Authenticate**
   ```bash
   claude auth login
   # Copy the URL to your Windows browser
   ```

## 🚦 Quick Commands

### Launch Claude Code
```bash
# From Windows (PowerShell/CMD)
cd C:\Users\%USERNAME%\Documents
wsl claude

# From within WSL
cd /mnt/c/Users/$USER/Documents
claude
```

### Essential WSL Commands
```bash
wsl --status          # Check WSL status
wsl --list --verbose  # List distributions
wsl --shutdown        # Restart WSL
wsl                   # Enter default distribution
```

## 📁 Repository Structure

```
CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE/
├── README.md                     # This file
├── docs/
│   ├── INSTALLATION.md          # Complete installation guide
│   ├── WINDOWS_SETUP.md         # Windows-specific setup
│   ├── SECURITY.md              # Security best practices
│   ├── QUICK_REFERENCE.md       # Command reference
│   ├── CAPABILITIES.md          # Capabilities & limitations
│   ├── TROUBLESHOOTING.md       # Problem solving
│   └── GITHUB_SSH.md            # GitHub integration
├── scripts/
│   ├── safe-launcher.bat        # Windows batch launcher
│   └── setup-claude.sh          # WSL setup script
└── LICENSE
```

## 🤝 Contributing

Found an issue or have an improvement? Please:

1. Fork this repository
2. Create a feature branch
3. Submit a pull request

Or open an issue to discuss changes.

## 📝 License

This guide is provided under the MIT License. See [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Anthropic team for creating Claude Code
- WSL team at Microsoft
- Community members who reported issues and solutions

## 🔗 Resources

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [WSL Documentation](https://docs.microsoft.com/en/us/windows/wsl/)
- [Report Claude Code Issues](https://github.com/anthropics/claude-code/issues)

---

**Remember**: The key to success with Claude Code on Windows is launching from the right directory. When in doubt:

```bash
cd C:\Users\%USERNAME%\Documents && wsl claude
```

Happy coding with Claude Code! 🎉