# ZSH Configuration Reorganization — Design Spec

**Date:** 2026-05-13
**Status:** Approved

## Problem

The current repository uses three load-order directories (`pre/`, `setup/`, `post/`) to control ZSH startup sequencing, plus parallel `setup/<platform>/` trees for Mac/Linux differences. This causes three pain points:

1. **Discoverability** — hard to know which file contains a given alias or function
2. **Unclear conventions** — adding a new tool config requires guessing where it belongs
3. **Confusing structure** — `pre/`/`setup/`/`post/` names are arbitrary and hard to explain

## Constraints

- Keep oh-my-zsh (not switching frameworks)
- Collapse platform differences into inline guards rather than parallel file trees
- Machine-local/sensitive content moves to a single `~/.zshrc.local` (gitignored)

## Target Structure

```
home/
  .zshrc                   # Explicit manifest — sources named files in order
  .zshrc.local             # Machine-local overrides (gitignored)
  .zsh/
    omz.sh                 # OMZ init, plugin list, theme, prompt settings
    path.sh                # All PATH additions (with inline mac/linux guards)
    exports.sh             # All env vars (EDITOR, LANG, JAVA_HOME, etc.)
    aliases.sh             # All aliases (with inline platform guards)
    functions.sh           # General-purpose utility functions
    tools/                 # One file per external tool
      asdf.sh
      bat.sh
      docker.sh
      fzf.sh
      git.sh
      k8s.sh
      python.sh
      rust.sh
      starship.sh
      zoxide.sh
      ... (one per tool)
  .config/
    starship.toml          # Unchanged
```

**Rule for `tools/` vs core files:** if it configures a specific named external program, it's a `tools/` file. If it's a general shell behavior (PATH, env vars, aliases, utility functions), it goes in one of the 5 core files.

## New `.zshrc` Manifest

```zsh
#!/bin/zsh

platform='unknown'
[[ $(uname) == 'Linux' ]]  && platform='linux'
[[ $(uname) == 'Darwin' ]] && platform='mac'
export platform

source ~/.zsh/omz.sh
source ~/.zsh/path.sh
source ~/.zsh/exports.sh
source ~/.zsh/aliases.sh
source ~/.zsh/functions.sh

for f in ~/.zsh/tools/*.sh; do source "$f"; done

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
```

Platform-specific behavior moves inline to the relevant file. Example in `aliases.sh`:

```zsh
if [[ $platform == mac ]]; then
  alias cat='/opt/homebrew/bin/bat'
else
  alias cat='/usr/bin/batcat'
  alias bat='/usr/bin/batcat'
fi
```

## Migration Mapping

### Consolidate into core files

| Source | Destination |
|---|---|
| `pre/mac.sh`, `pre/linux.sh` | OMZ init → `omz.sh`; PATH → `path.sh`; env vars → `exports.sh`; aliases → `aliases.sh` |
| `post/mac.sh`, `post/linux.sh` | PATH additions → `path.sh`; POWERLINE_DIR, conda init → `exports.sh` / `path.sh` |
| `setup/misc.sh` | Aliases → `aliases.sh`; utility functions (mcd, extract, psgrep, etc.) → `functions.sh` |
| `.zshrc` inline content | LANG, PYTHONSTARTUP, GPG_TTY, HISTSIZE, setopts → `exports.sh`; cowsay block → `functions.sh` |

### Move 1:1 into `tools/`

All remaining files in `setup/*.sh` and `setup/<platform>/*.sh` move to `tools/`, with any platform-specific forks collapsed inline:

`fzf.sh`, `git.sh`, `docker.sh`, `asdf.sh`, `bat.sh`, `k8s.sh`, `python.sh`, `rust.sh`, `node_js.sh`, `ansible.sh`, `terraform.sh`, and remaining tool files. Starship and zoxide evals become `tools/starship.sh` and `tools/zoxide.sh`.

The powerline daemon start (`powerline-daemon -q`) and `source powerline.zsh` from `post/mac.sh` move to `tools/powerline.sh`. Since `tools/` is sourced after all core files in the manifest, the PATH is already set when powerline loads — no ordering issue.

### Files/directories that go away

- `setup/mac/` and `setup/linux/` — content folds into relevant core or tool file
- `setup/local/` — content becomes `~/.zshrc.local` on each machine
- `pre/` and `post/` directories — fully absorbed into core files

## `.gitignore` Addition

```
home/.zshrc.local
```

## What Does Not Change

- `home/.config/starship.toml` — untouched
- `envsetup.sh` at repo root — manually sourced for Azure/Claude Code work, not part of shell startup
- homesick deployment workflow (`homesick link spicy-zsh`) — unchanged
