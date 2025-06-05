# Claude Code Windows Troubleshooting Guide

## Common Installation Issues & Solutions

### 1. npm: command not found (in PowerShell)
**Error:**
```
npm : The term 'npm' is not recognized as the name of a cmdlet...
```

**Cause:** Trying to install Claude Code directly in Windows PowerShell/CMD

**Solution:** Claude Code requires Linux. Install WSL first:
```powershell
wsl --install
```
Then install Claude Code inside WSL/Ubuntu.

### 2. Claude Code is not supported on Windows
**Error:**
```
npm error Error: Claude Code is not supported on Windows.
npm error Claude Code requires macOS or Linux to run properly.
```

**Cause:** Attempting to install in Windows instead of WSL

**Solution:** 
1. Install WSL (see installation guide)
2. Open Ubuntu/WSL terminal
3. Install from within WSL, not PowerShell

### 3. WSL opens then immediately closes
**Cause:** WSL not properly configured or missing distribution

**Solution:**
```powershell
# Check WSL status
wsl --status

# Install Ubuntu
wsl --install -d Ubuntu

# If still failing, check Windows version
winver
```
You need Windows 10 version 2004+ or Windows 11.

### 4. Permission denied during npm install
**Error:**
```
npm error Error: EACCES: permission denied, mkdir '/usr/lib/node_modules/@anthropic-ai'
```

**Cause:** Missing sudo privileges

**Solution:** Always use sudo for global installs:
```bash
sudo npm install -g @anthropic-ai/claude-code
```

### 5. claude: command not found
**Cause:** The command is `claude`, not `claude-code`, and PATH may not be updated

**Solution:**
```bash
# Create symlink
sudo ln -s /usr/lib/node_modules/@anthropic-ai/claude-code/cli.js /usr/local/bin/claude

# Add to PATH
export PATH="/usr/local/bin:$PATH"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Or create alias
echo 'alias claude="node /usr/lib/node_modules/@anthropic-ai/claude-code/cli.js"' >> ~/.bashrc
source ~/.bashrc
```

### 6. Browser won't open for authentication
**Cause:** WSL can't directly open Windows browsers

**Solution:**
1. Run `claude auth login`
2. Copy the URL it shows
3. Paste into your Windows browser manually
4. Complete authentication
5. Return to WSL terminal

### 7. Can't access files outside current directory
**Error:**
```
ERROR: cd to '/home/user' was blocked. For security, Claude Code may only change directories to child directories...
```

**Cause:** Launched Claude from a system directory (like C:\Windows\system32)

**Solution:** Always launch from user directories:
```bash
cd /mnt/c/Users/YourUsername/Documents
claude
```

### 8. Git operations failing in WSL
**Error:**
```
fatal: not a git repository
error: chmod on .git/config.lock failed: Operation not permitted
fatal: detected dubious ownership in repository
```

**Cause:** WSL filesystem permission mismatches and security features

**Solution:** 
1. **For "dubious ownership":**
   ```bash
   git config --global --add safe.directory $(pwd)
   ```

2. **For chmod errors:** These are cosmetic - your git commands still work!
   ```bash
   git config --global core.filemode false
   ```

3. **For "not a git repository":** Ensure .git directory exists:
   ```bash
   ls -la .git/
   # If missing, reinitialize:
   git init -b main
   ```

**For detailed WSL git solutions, see:** [WSL Git & GitHub Guide](WSL_GIT_GITHUB_GUIDE.md)

### 9. Node.js version issues
**Error:**
```
engines": { "node": ">=18.0.0" }
```

**Solution:** Update Node.js in WSL:
```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### 10. WSL performance is slow
**Cause:** Working with files across filesystem boundaries

**Solution:** 
- For best performance: Work in WSL filesystem (`~/projects`)
- For Windows integration: Work in `/mnt/c/Users/YourName/`
- Avoid: Working in Windows system directories

## Quick Diagnostic Commands

### Check your environment:
```bash
# WSL version
wsl --version

# Ubuntu version
lsb_release -a

# Node version
node --version

# npm version
npm --version

# Claude location
which claude

# Current directory
pwd

# Check permissions
ls -la
```

### Reset Claude Code:
```bash
# Uninstall
sudo npm uninstall -g @anthropic-ai/claude-code

# Clear npm cache
npm cache clean --force

# Reinstall
sudo npm install -g @anthropic-ai/claude-code

# Recreate symlink
sudo ln -s /usr/lib/node_modules/@anthropic-ai/claude-code/cli.js /usr/local/bin/claude
```

## Prevention Tips

1. **Always work in user directories**, never in system directories
2. **Use sudo** for global npm installations
3. **Launch Claude** from appropriate directories
4. **Keep WSL updated**: `wsl --update`
5. **Document your setup** for future reference

## Still Having Issues?

1. Check the [installation guide](CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE.md)
2. Review [security best practices](CLAUDECODE_SECURITY_BEST_PRACTICES.md)
3. Visit https://github.com/anthropics/claude-code/issues
4. Make sure you're following the exact steps in order

## Emergency Recovery

If everything is broken:
```powershell
# In PowerShell (Admin)
wsl --shutdown
wsl --unregister Ubuntu
wsl --install -d Ubuntu
```
Then follow the installation guide from the beginning.

Remember: Most issues come from trying to run Claude Code in Windows directly or from system directories. Always use WSL and work in appropriate directories!