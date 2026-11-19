#!/usr/bin/env bash
#
# Symlinks the dotfiles into place. Safe to run more than once:
# existing links are replaced, real files are moved aside first.

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# file in this repo        ->  where it is linked
links=(
  "shell/bash_profile:$HOME/.bash_profile"
  "shell/zshrc:$HOME/.zshrc"
  "shell/inputrc:$HOME/.inputrc"
  "git/gitconfig:$HOME/.gitconfig"
  "vim/vimrc:$HOME/.vimrc"
  "zed/settings.json:$HOME/.config/zed/settings.json"
  "zed/tasks.json:$HOME/.config/zed/tasks.json"
)

link() {
  local src="$DOTFILES/$1" dest="$2"

  mkdir -p "$(dirname "$dest")"

  if [[ -e "$dest" && ! -L "$dest" ]]; then
    local backup="$dest.backup-$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "backed up  $dest -> $backup"
  fi

  ln -sfn "$src" "$dest"
  echo "linked     $dest -> $src"
}

for entry in "${links[@]}"; do
  link "${entry%%:*}" "${entry#*:}"
done

if [[ ! -f "$HOME/.gitconfig.local" ]]; then
  echo
  echo "No ~/.gitconfig.local yet. Set your git identity for this machine:"
  echo "  git config --file ~/.gitconfig.local user.name  \"Your Name\""
  echo "  git config --file ~/.gitconfig.local user.email \"you@example.com\""
fi
