#   -------------------------------------------------------------
#   .bash_profile
#
#   Bash configuration - sources common files shared with zsh
#   -------------------------------------------------------------

#
#   Common configuration (shared with zsh)
#   -------------------------------------------------------------
source ~/.dotfiles/common/environment
source ~/.dotfiles/common/aliases
source ~/.dotfiles/common/git_prompt

#
#   Work-specific configuration (gitignored)
#   -------------------------------------------------------------
[[ -f ~/.dotfiles/common/work ]] && source ~/.dotfiles/common/work

#
#   Bash auto-completion
#   -------------------------------------------------------------
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#
#   Git auto-completion
#   -------------------------------------------------------------
if [ -f ~/.dotfiles/bash_git_completion.bash ]; then
  source ~/.dotfiles/bash_git_completion.bash
  __git_complete g __git_main
fi

#
#   Npm Auto Completion
#   ------------------------------------------------------------
if [ -f ~/.dotfiles/bash_npm_autocompletion.bash ]; then
  source ~/.dotfiles/bash_npm_autocompletion.bash
fi

#
#   Avoid successive duplicates in bash command history
#   ------------------------------------------------------------
export HISTCONTROL=ignoredups

#
#   Silence macOS bash deprecation warning
#   ------------------------------------------------------------
export BASH_SILENCE_DEPRECATION_WARNING=1

#
#   iTerm shell integration
#   ------------------------------------------------------------
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#
#   Homebrew
#   ------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

#
#   Cargo (Rust)
#   ------------------------------------------------------------
. "$HOME/.cargo/env"

#   Prompt colors
#   ------------------------------------------------------------
GRAY="\[\e[0;00m\]"
WHITE='\[\e[0;37m\]'
YELLOW="\[\e[0;33m\]"
LIGHT_BLUE="\[\e[0;94m\]"
LIGHT_CYAN="\[\e[0;96m\]"
LIGHT_MAGENTA="\[\e[0;95m\]"

#   Git branch in prompt
#   ------------------------------------------------------------
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#   Git prompt with status indicator
#   ------------------------------------------------------------
_git_prompt() {
  local ansi="$(_git_status_ansi)"
  if [ -n "$ansi" ]; then
    echo -n '\[\e[0;37;'"$ansi"';1m\] \[\e[0m\] '
  fi
}

#   Set prompt
#   ------------------------------------------------------------
_prompt_command() {
    PS1="╭─`_git_prompt`${WHITE}\t ${LIGHT_CYAN}\u${GRAY}@${LIGHT_BLUE}\h ${YELLOW}\w${LIGHT_MAGENTA}\$(parse_git_branch)${GRAY}\n╰─$ "
}
PROMPT_COMMAND=_prompt_command
