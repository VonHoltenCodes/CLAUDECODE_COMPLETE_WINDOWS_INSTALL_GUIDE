#!/bin/bash
# Claude Code WSL Setup Script
# This script automates the installation of Claude Code in WSL

set -e

echo "Claude Code WSL Setup Script"
echo "============================"
echo

# Check if running in WSL
if ! grep -q Microsoft /proc/version; then
    echo "Error: This script must be run in WSL (Windows Subsystem for Linux)"
    exit 1
fi

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install Node.js
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Verify Node.js installation
echo "Node.js version: $(node --version)"
echo "npm version: $(npm --version)"

# Install Claude Code
echo "Installing Claude Code..."
sudo npm install -g @anthropic-ai/claude-code

# Create symlink
echo "Creating claude command..."
sudo ln -sf /usr/lib/node_modules/@anthropic-ai/claude-code/cli.js /usr/local/bin/claude
sudo chmod +x /usr/local/bin/claude

# Update PATH
echo "Updating PATH..."
export PATH="/usr/local/bin:$PATH"

# Check if .bashrc update needed
if ! grep -q "/usr/local/bin" ~/.bashrc; then
    echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
fi

# SSH setup
echo
echo "Setting up SSH for GitHub (optional)..."
read -p "Do you want to set up SSH for GitHub? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Enter your GitHub email: " github_email
    ssh-keygen -t ed25519 -C "$github_email" -f ~/.ssh/id_ed25519 -N ""
    
    # Add SSH agent startup to bashrc
    if ! grep -q "SSH_AUTH_SOCK" ~/.bashrc; then
        echo '
# Auto-start SSH agent
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)" > /dev/null
   ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi' >> ~/.bashrc
    fi
    
    echo
    echo "Your SSH public key:"
    echo "===================="
    cat ~/.ssh/id_ed25519.pub
    echo
    echo "Add this key to GitHub: https://github.com/settings/keys"
    echo
fi

echo
echo "Installation complete!"
echo "====================="
echo
echo "Next steps:"
echo "1. Run: source ~/.bashrc"
echo "2. Run: claude auth login"
echo "3. Copy the URL to your Windows browser to authenticate"
echo
echo "Remember: Always launch Claude Code from user directories, not system directories!"
echo "Example: cd /mnt/c/Users/$USER/Documents && claude"