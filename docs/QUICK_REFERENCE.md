# Claude Code Windows Quick Reference Card

## 🚀 Starting Claude Code

### From Windows (Recommended)
```bash
# From a safe directory:
cd C:\Users\traxx\Documents
wsl claude

# Quick start from anywhere (but check where you are!):
wsl claude
```

### Creating a Safe Launch Script
Save as `claude.bat` in a directory in your PATH:
```batch
@echo off
cd C:\Users\%USERNAME%\Documents
wsl claude %*
```

## 📁 Directory Navigation

### Key Paths
| Windows Path | WSL Path |
|-------------|----------|
| C:\Users\traxx | /mnt/c/Users/traxx |
| C:\Windows\system32 | /mnt/c/Windows/system32 |
| D:\Projects | /mnt/d/Projects |
| Desktop | /mnt/c/Users/traxx/Desktop |

### Quick Commands
```bash
# See current directory
pwd

# List files
ls -la

# Go to Windows home
cd /mnt/c/Users/traxx

# Go to Documents
cd /mnt/c/Users/traxx/Documents
```

## 🛠️ Essential Claude Code Commands

### In Claude Code
- `/help` - Get help
- `/clear` - Clear screen
- `/exit` - Exit Claude Code

### Managing Claude Code
```bash
# Check version
wsl claude --version

# Update Claude Code
wsl -e bash -c "npm update -g @anthropic-ai/claude-code"

# Check if installed
wsl which claude
```

## 🔧 WSL Management

```bash
# List distributions
wsl -l -v

# Shutdown WSL
wsl --shutdown

# Enter Ubuntu directly
wsl

# Run single command
wsl [command]

# Check WSL version
wsl --version
```

## ⚡ Common Tasks

### File Operations
```bash
# Create file
echo "content" > filename.txt

# Edit file (through Claude)
# Just ask: "edit filename.txt"

# Copy between Windows and WSL
cp /mnt/c/Users/traxx/file.txt ~/file.txt
```

### Git Operations
```bash
# These work normally in Claude Code
git status
git add .
git commit -m "message"
git push
```

### Development Commands
```bash
# Node.js
npm install
npm start
npm test

# Python
python script.py
pip install package

# General
make
./script.sh
```

## ⚠️ Security Quick Rules

### ✅ DO
- Launch from user directories
- Work in /mnt/c/Users/traxx/...
- Keep projects organized
- Review before executing

### ❌ DON'T
- Launch from C:\Windows\system32
- Try to edit system files
- Store passwords in files
- Run unknown scripts

## 🚨 Troubleshooting

### Claude Code Won't Start
```bash
# 1. Check WSL is running
wsl -l --running

# 2. Restart WSL
wsl --shutdown

# 3. Try again
wsl claude
```

### Permission Denied
- You're probably in a system directory
- Close and relaunch from user directory

### Can't Find Files
- Windows files are under /mnt/c
- Use full paths or cd to the directory first

### File Not Updating
- Make sure you're editing in /mnt/c not in WSL filesystem
- Check file permissions

## 💡 Pro Tips

### 1. Create Aliases
Add to `~/.bashrc` in WSL:
```bash
alias projects='cd /mnt/c/Users/traxx/Documents/Projects'
alias desktop='cd /mnt/c/Users/traxx/Desktop'
```

### 2. Set Default Directory
Add to `~/.bashrc`:
```bash
# Start in Documents when opening WSL
cd /mnt/c/Users/traxx/Documents
```

### 3. Quick Project Setup
```bash
# Create and enter new project
mkdir /mnt/c/Users/traxx/Documents/newproject
cd /mnt/c/Users/traxx/Documents/newproject
wsl claude
```

## 📝 File Type Notes

| Type | Windows | WSL | Note |
|------|---------|-----|------|
| Text | CRLF | LF | May need conversion |
| Scripts | .bat/.ps1 | .sh | Different formats |
| Config | Various | Usually .conf | Check line endings |

## 🔗 Useful Resources

- Claude Code Issues: https://github.com/anthropics/claude-code/issues
- WSL Documentation: https://docs.microsoft.com/windows/wsl
- This guide: C:\Windows\system32\CLAUDECODE_QUICK_REFERENCE.md

## 🎯 Quick Wins

1. **Always launch from**: `C:\Users\traxx\Documents`
2. **Emergency stop**: `wsl --shutdown`
3. **Safe workspace**: Create `C:\ClaudeWorkspace`
4. **Track changes**: Use git in your projects
5. **Stay organized**: One project = one directory

---
Remember: When in doubt, launch from Documents! 📂