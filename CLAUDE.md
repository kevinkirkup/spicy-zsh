# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a homesick-managed ZSH dotfiles repository. Files under `home/` map directly to `~/` on the target machine. Changes here are deployed by running `homesick link spicy-zsh` to create symlinks.

## Repository Layout

- `home/.zshrc` — Entry point; sets `$platform`, then sources all files in explicit order
- `home/.zsh/omz.sh` — oh-my-zsh init, plugin list, theme (platform-branched inline)
- `home/.zsh/path.sh` — all PATH additions (platform-branched inline)
- `home/.zsh/exports.sh` — env vars, ZSH `setopt` options (platform-branched inline)
- `home/.zsh/aliases.sh` — all aliases (platform-branched inline)
- `home/.zsh/functions.sh` — general utility functions (platform-branched inline)
- `home/.zsh/tools/` — one file per external tool, sourced alphabetically
- `home/.zshrc.local` — machine-local overrides, gitignored
- `home/.config/starship.toml` — Starship prompt config
- `envsetup.sh` — Azure/Foundry environment variables for Claude Code; `source envsetup.sh` before use

## Load Order

`.zshrc` sources files in this sequence:
1. `omz.sh` — oh-my-zsh + plugins
2. `path.sh` — PATH setup
3. `exports.sh` — env vars and ZSH options
4. `aliases.sh` — aliases
5. `functions.sh` — utility functions
6. `tools/*.sh` — external tool configs (glob, alphabetical)
7. `.zshrc.local` — machine-local overrides (if present)

## Key Conventions

- Platform detection: `[[ $(uname) == 'Darwin' ]] && platform='mac'`; all platform branching uses inline `[[ $platform == mac ]]` guards within each file, not separate per-platform files
- Tool configs in `tools/` are unconditionally sourced — guard with existence checks (`[ -f ... ]` or `command -v`) when the tool may not be installed
- `home/.zshrc.local` is for machine-specific values (API tokens, work paths) that vary per host; it is gitignored
- `tools/jira.sh` contains a blank `ATLASSIAN_API_TOKEN=` — fill in locally via `.zshrc.local`, never commit tokens
- `envsetup.sh` at repo root is for Azure Foundry Claude Code config; source it manually, never from `.zshrc`

## Adding New Tool Configuration

1. Create `home/.zsh/tools/<toolname>.sh` — use an existence check if the tool may not be present everywhere
2. Run `homesick link spicy-zsh` after adding files to create the symlink on the live system

## Deploying Changes

```sh
homesick link spicy-zsh   # create/update symlinks
source ~/.zshrc            # reload in current shell
```
