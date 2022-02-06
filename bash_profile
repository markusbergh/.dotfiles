#   -------------------------------------------------------------
#   .bash_profile
#
#   This file contains all of bash configuration and aliases.
#   -------------------------------------------------------------

#
#   Bash auto-completion
#   -------------------------------------------------------------
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#
#   Git auto-completion
#   -------------------------------------------------------------
if [ -f ~/.dotfiles/bash_git_completion.bash ]; then
  source ~/.dotfiles/bash_git_completion.bash

  # Add git completion to aliases
  __git_complete g __git_main
fi

#
#   Bash Aliases
#   ------------------------------------------------------------
if [ -f ~/.dotfiles/bash_aliases.bash ]; then
  source ~/.dotfiles/bash_aliases.bash
fi

#
#   Npm Auto Completion
#   ------------------------------------------------------------
if [ -f ~/.dotfiles/bash_npm_autocompletion.bash ]; then
  source ~/.dotfiles/bash_npm_autocompletion.bash
fi

#   Paths
#   ------------------------------------------------------------
export PATH="$PATH:/opt/local/bin:/usr/local/sbin"

#   Set default blocksize for ls, df, du
#   ------------------------------------------------------------
export BLOCKSIZE=1k

#
#   Avoid succesive duplicates in the bash command history.
#   ------------------------------------------------------------
export HISTCONTROL=ignoredups

#
#   Set Default Editor
#   ------------------------------------------------------------
export EDITOR=vim

#
#   Setup colors for listing
#   ------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS="HxFxcxdxCxegedabagacad"

#
#   Avoid succesive duplicates in the bash command history.
#   ------------------------------------------------------------
export HISTCONTROL=ignoredups

#   Prompt colors
#   ------------------------------------------------------------
#
GRAY="\[\e[0;00m\]"
BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
ORANGE="\[\e[0;33m\]"
GREEN="\[\e[0;32m\]"
PURPLE="\[\e[0;35m\]"
WHITE='\[\e[0;37m\]'
YELLOW="\[\e[0;33m\]"
CYAN="\[\e[0;36m\]"
BLUE="\[\e[0;34m\]"
MAGENTA="\[\e[0;35m\]"
LIGHT_BLUE="\[\e[0;94m\]"
LIGHT_CYAN="\[\e[0;96m\]"
LIGHT_MAGENTA="\[\e[0;95m\]"

#   Git branch in prompt
#   ------------------------------------------------------------
#
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#
# Git status
#
_git_prompt() {
  local git_status="`git status -unormal 2>&1`"

  if ! [[ "$git_status" =~ not\ a\ git\ repo ]]; then
    if [[ "$git_status" =~ nothing\ to\ commit ]]; then
      local ansi=42
    elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
      local ansi=43
    else
      local ansi=43
    fi

    if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
      branch=${BASH_REMATCH[1]}
      test "$branch" != master || branch=' '
    else
      # Detached HEAD.  (branch=HEAD is a faster alternative.)
      branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
    fi

    echo -n '\[\e[0;37;'"$ansi"';1m\] \[\e[0m\] '
  fi
}

#
# Set prompt
#
_prompt_command() {
    PS1="╭─`_git_prompt`${WHITE}\t ${LIGHT_CYAN}\u${GRAY}@${LIGHT_BLUE}\h ${YELLOW}\w${LIGHT_MAGENTA}\$(parse_git_branch)${GRAY}\n╰─$ "
}
PROMPT_COMMAND=_prompt_command

#
# Mac OS Catalina
#
export BASH_SILENCE_DEPRECATION_WARNING=1

#
# iTerm shell integration
#
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# 
# Autojump
#
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

eval "$(/opt/homebrew/bin/brew shellenv)"

