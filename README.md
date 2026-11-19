# dotfiles

Shell, git, vim and Zed configuration for macOS.

## Install

```bash
git clone git@github.com:markusbergh/.dotfiles.git ~/.dotfiles
~/.dotfiles/install.sh
```

`install.sh` symlinks each file into place and can be re-run at any time. Real files it would replace are moved aside with a `.backup-<timestamp>` suffix.

## Layout

| Path | Linked to | Notes |
| --- | --- | --- |
| `shell/bash_profile` | `~/.bash_profile` | |
| `shell/zshrc` | `~/.zshrc` | |
| `shell/inputrc` | `~/.inputrc` | |
| `shell/aliases`, `environment`, `git_prompt` | — | Sourced by both bash and zsh |
| `git/gitconfig` | `~/.gitconfig` | Includes `~/.gitconfig.local` |
| `vim/vimrc` | `~/.vimrc` | |
| `zed/settings.json`, `zed/tasks.json` | `~/.config/zed/` | |
| `bin/` | — | Added to `PATH` (e.g. `xcoderun`) |

## Machine-specific settings

These stay out of the repo:

- **`~/.gitconfig.local`**: git identity (name, email) and anything else per machine. Write to it with `git config --file ~/.gitconfig.local …`; plain `git config --global` writes into the tracked `git/gitconfig`.
- **`shell/work`**: extra shell config, sourced if present (gitignored).
