# Claude Code Windows Security Best Practices

## Critical Security Rules

### 1. NEVER Launch from System Directories
❌ **DO NOT** launch Claude Code from:
- C:\Windows\system32
- C:\Windows
- C:\Program Files
- C:\Program Files (x86)
- Any Windows system folders

✅ **DO** launch from:
- C:\Users\[YourUsername]\Documents
- C:\Users\[YourUsername]\Desktop
- C:\Development (or your custom dev folder)
- Any user-created project directories

### 2. Directory Access Restrictions
Claude Code implements security restrictions based on launch location:
- Can only access subdirectories of the launch location
- Cannot navigate to parent directories
- Cannot access other drive roots when launched from restricted locations

### 3. File System Protection Strategies

#### For Maximum Security:
1. **Create a dedicated workspace**:
   ```
   C:\ClaudeWorkspace\
   ```
2. **Only launch Claude Code from within this workspace**
3. **Keep sensitive files outside this workspace**

#### Project Isolation:
```
C:\Development\
├── Project1\      ← Launch Claude from here for Project1
├── Project2\      ← Launch Claude from here for Project2
└── Sandbox\       ← Safe testing area
```

### 4. Safe Command Execution

#### Commands to Avoid:
- System modification commands
- Registry editing tools
- Windows service management
- Direct execution of .exe files from system directories

#### Safe Commands:
- Development tools (git, npm, python, etc.)
- File operations within project directory
- Build and compilation commands
- Text processing utilities

### 5. Working with Sensitive Data

1. **Never store credentials** in files Claude Code can access
2. **Use environment variables** for sensitive configuration
3. **Keep production configs** outside the workspace
4. **Review all file operations** before confirming

### 6. WSL Security Considerations

#### File Permissions:
- Files created in WSL have Linux permissions
- Windows sees these through permission translation
- Be cautious with executable permissions

#### Network Isolation:
- WSL2 runs in a virtual machine with NAT
- Localhost in WSL2 is different from Windows localhost
- Use proper firewall rules for exposed services

### 7. Recommended Security Setup

```bash
# 1. Create secure workspace
mkdir C:\ClaudeWorkspace
mkdir C:\ClaudeWorkspace\Projects
mkdir C:\ClaudeWorkspace\Sandbox

# 2. Create launch script (save as claude-safe.bat)
@echo off
cd C:\ClaudeWorkspace
wsl claude %*

# 3. Use this script instead of direct launch
claude-safe.bat
```

### 8. Security Checklist

Before each session:
- [ ] Launching from a safe directory (not system folder)
- [ ] No sensitive files in the working directory
- [ ] Understand what files Claude will have access to
- [ ] Have backups of important files
- [ ] Review commands before execution

### 9. Monitoring and Auditing

#### Track Claude Code Activity:
1. **File Changes**: Use git to track modifications
2. **Command History**: WSL maintains bash history in `~/.bash_history`
3. **System Logs**: Windows Event Viewer can show WSL activity

### 10. Emergency Procedures

#### If Something Goes Wrong:
1. **Immediately**: `wsl --shutdown`
2. **Check**: Review recent file changes
3. **Restore**: Use Windows File History or backups
4. **Report**: Any security issues to Anthropic

#### Suspicious Activity Signs:
- Unexpected system file access attempts
- Unusual network connections
- Modifications outside project directory
- Execution of unknown scripts

### 11. Integration with Windows Security

#### Windows Defender:
- Scans files in WSL2
- May flag development tools as false positives
- Add development folders to exclusions carefully

#### User Account Control (UAC):
- WSL operations respect Windows UAC
- Claude Code cannot elevate privileges
- Admin operations require separate authorization

### 12. Best Practices Summary

1. **Principle of Least Privilege**: Only give access to necessary directories
2. **Workspace Isolation**: Separate projects and environments
3. **Regular Reviews**: Check file changes and command history
4. **Backup Strategy**: Always have backups before major operations
5. **Trust but Verify**: Review Claude's suggestions before executing

## Remember
Claude Code is a powerful tool, but like any development environment, it should be used with appropriate security measures. The built-in restrictions when launched from system directories are there to protect you - work with them, not against them.