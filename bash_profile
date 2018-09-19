#   -------------------------------------------------------------
#   .bash_profile
#
#   This file contains all of bash configuration and aliases.
#   -------------------------------------------------------------

#
#   Git auto-completion
#   -------------------------------------------------------------
source ~/.dotfiles/git-completion.bash

#
#   Startup and user specific
#   ------------------------------------------------------------
alias reload="source ~/.bash_profile"

#   Paths
#   ------------------------------------------------------------
export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/opt/bin:/usr/local/bin:/usr/local/:/usr/local/sbin:$PATH"

#   Set default blocksize for ls, df, du
#   ------------------------------------------------------------
export BLOCKSIZE=1k

#
#   Set vim as vi
#   ------------------------------------------------------------
alias vi="vim"
alias sudo="sudo "

#
#   Set Default Editor
#   ------------------------------------------------------------
export EDITOR=vim

#
#   Include colors when listing
#   ------------------------------------------------------------
alias ls="ls -G"

#
#   Setup colors for listing
#   ------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=HxgxcxdxCxegedabagacad

#
#   Open all (with uncommited changes) files in vim
#   ------------------------------------------------------------
alias vi-git-status='vi -p `git status --porcelain | cut -c4-`'

#
#   Terminal aliases
#   ------------------------------------------------------------
alias ll='ls -FGlAhp' # Preferred 'll'

#
#   Remove .DS_Store recursivly
#   ------------------------------------------------------------
alias rm_dstore='find . -name '.DS_Store' -type f -delete'

#
#   Avoid succesive duplicates in the bash command history.
#   ------------------------------------------------------------
export HISTCONTROL=ignoredups


#   Git aliases
#   ------------------------------------------------------------
#
alias g='git'
alias gp='git push'
alias gb='git branch'
alias gc='git checkout'
alias gm='git commit -m'
alias gma='git commit -am'
alias gd='git diff'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gl='git log'
alias ga='git add'
alias gs='git status'

#   Searching
#   ------------------------------------------------------------
#
alias quickfind='find . -name '
ff () { find . -name "*$1*" -ls ; }

#   Networking
#   ------------------------------------------------------------
#
alias myip='curl -s -w "\n" http://whatismyip.akamai.com/'
alias ipen0='ipconfig getpacket en0'

#   OS
#   ------------------------------------------------------------
alias dsstoredelete='find . -type f -name "*.DS_Store" -ls -delete'

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
    PS1="`_git_prompt`${WHITE}\t ${LIGHT_CYAN}\u${GRAY}@${LIGHT_BLUE}\h ${YELLOW}\w${LIGHT_MAGENTA}\$(parse_git_branch)${GRAY} $ "
}
PROMPT_COMMAND=_prompt_command
