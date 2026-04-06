# dotfiles

Quick setup for a familiar operating environment on any machine.

## Prerequisites

- Unix-like system (macOS or Linux)
- `git` installed

## Installation

```bash
git clone https://github.com/senwang/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then create a `~/.zsh_local` file for machine-specific settings (optional).

## What Gets Installed

| Component | Description |
|-----------|-------------|
| **zsh + Oh My Zsh** | Shell with plugins (git, ssh, docker, starship) |
| **tmux** | Terminal multiplexer with Catppuccin theme |
| **neovim + LazyVim** | Editor with Catppuccin Mocha theme |
| **Homebrew** | Package manager (macOS or Linuxbrew on Linux) |

## Manual Steps After Install

1. **tmux**: Press `prefix + I` (default: `Ctrl-a I`) to install TPM plugins
2. **neovim**: Open nvim and let LazyVim auto-install plugins

## Machine-Specific Configuration

Create `~/.zsh_local` for settings that should only exist on specific machines:

```zsh
# Example ~/.zsh_local
export EDITOR='nvim'
export GITHUB_TOKEN="your-token-here"

# OpenClaw completions
if [[ -f "$HOME/.openclaw/completions/openclaw.zsh" ]]; then
  source "$HOME/.openclaw/completions/openclaw.zsh"
fi

# bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
```

## Troubleshooting

### tmux plugins not loading
Press `prefix + I` to fetch TPM plugins (prefix is `Ctrl-a` on Linux, `Ctrl-a` on macOS).

### neovim lazy-lock.json issues
Delete `lazy-lock.json` and restart nvim to force fresh plugin installation.

### Homebrew not found after install
Add to your shell:
```zsh
eval "$(brew shellenv)"  # macOS
# or
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"  # Linux
```

## Uninstallation

```bash
cd ~/dotfiles
./cleanup.sh
```