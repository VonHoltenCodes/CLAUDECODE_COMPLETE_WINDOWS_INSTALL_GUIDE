# Setting Up This Repository on GitHub

**⚠️ IMPORTANT:** If you're using WSL (Windows Subsystem for Linux), you'll encounter permission errors with git. These are normal and don't prevent git from working. For a detailed guide on handling WSL-specific git issues, see [WSL Git & GitHub Guide](docs/WSL_GIT_GITHUB_GUIDE.md).

Since we can't initialize git in the system32 directory, follow these steps:

## 1. Move the Repository

First, move this folder to a proper location:

```bash
# In Windows PowerShell or CMD
xcopy /E /I "C:\Windows\system32\CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE" "C:\Users\%USERNAME%\Documents\CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE"
```

## 2. Initialize Git

```bash
# In WSL
cd /mnt/c/Users/$USER/Documents/CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE
git init
git branch -m main
```

## 3. Create Repository on GitHub

1. Go to https://github.com/new
2. Repository name: `CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE`
3. Description: "Complete guide for installing Claude Code on Windows through WSL"
4. Make it public
5. DON'T initialize with README (we already have one)
6. Click "Create repository"

## 4. Push to GitHub

```bash
# Add all files
git add .
git commit -m "Initial commit: Complete Claude Code Windows installation guide"

# Add remote (replace VonHoltenCodes with your username if different)
git remote add origin git@github.com:VonHoltenCodes/CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE.git

# Push to GitHub
git push -u origin main
```

## 5. Verify

Visit https://github.com/VonHoltenCodes/CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE to see your repository!

## Alternative: Quick Commands

If you want to do it all at once (after moving the folder):

```bash
cd /mnt/c/Users/$USER/Documents/CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE
git init
git branch -m main
git add .
git commit -m "Initial commit: Complete Claude Code Windows installation guide"
git remote add origin git@github.com:VonHoltenCodes/CLAUDECODE_COMPLETE_WINDOWS_INSTALL_GUIDE.git
git push -u origin main
```

## Common Issues & Solutions

### Permission Errors in WSL
If you see errors like:
```
error: chmod on .git/config.lock failed: Operation not permitted
```
This is NORMAL in WSL. Your git operations are still working! See [WSL Git & GitHub Guide](docs/WSL_GIT_GITHUB_GUIDE.md) for details.

### Quick Fix for Most Issues
```bash
# Add repository as safe directory
git config --global --add safe.directory $(pwd)

# Retry your git command
```