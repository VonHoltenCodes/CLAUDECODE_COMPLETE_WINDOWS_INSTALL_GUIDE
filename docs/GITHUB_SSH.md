# GitHub SSH Setup Guide for WSL

## Generate SSH Key

1. **Check for existing SSH keys**
```bash
ls -la ~/.ssh
```

2. **Generate a new SSH key**
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
- Replace `your_email@example.com` with your GitHub email
- When prompted for file location, press Enter for default
- Set a passphrase (recommended) or press Enter for no passphrase

3. **Start the SSH agent**
```bash
eval "$(ssh-agent -s)"
```

4. **Add your SSH key to the agent**
```bash
ssh-add ~/.ssh/id_ed25519
```

## Add SSH Key to GitHub

1. **Copy your public key**
```bash
cat ~/.ssh/id_ed25519.pub
```
Copy the entire output (starts with `ssh-ed25519`)

2. **Add to GitHub**
- Go to https://github.com/settings/keys
- Click "New SSH key"
- Give it a title (e.g., "WSL Ubuntu")
- Paste your key
- Click "Add SSH key"

## Configure Git

1. **Set your Git identity**
```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

2. **Test the connection**
```bash
ssh -T git@github.com
```
You should see: "Hi username! You've successfully authenticated..."

## Using SSH with Git

Now you can clone repositories using SSH:
```bash
git clone git@github.com:username/repository.git
```

## Troubleshooting

### Permission denied (publickey)
- Make sure you copied the entire public key
- Verify the key is added to GitHub
- Check SSH agent is running: `ssh-add -l`

### SSH agent not persisting
Add to your `~/.bashrc`:
```bash
# Auto-start SSH agent
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
fi
```

## Security Notes
- Never share your private key (id_ed25519)
- Only share the public key (id_ed25519.pub)
- Use a passphrase for extra security
- Keep your keys in ~/.ssh with proper permissions (600)