# .bash_profile

# User specific environment and startup programs
alias reload="source ~/.bash_profile"

# Use vim as vi
alias vi="vim"
alias sudo="sudo "

#
# Set editor
#
export EDITOR=vim

#
# Use ls with colors
#
alias ls="ls -G"

#
# Set up colors for ls
#
export CLICOLOR=1
export LSCOLORS=HxgxcxdxCxegedabagacad

#
# Open all files with uncommited
# changes in vim (with tabs)
#
alias vi-git-status='vi -p `git status --porcelain | cut -c4-`'

#
# Git aliases
#
alias gp='git push'
alias gb='git branch'
alias gc='git checkout'
alias gm='git commit -m'
alias gma='git commit -am'
alias gd='git diff'
alias gs='git status'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gl='git log'
alias ga='git add'
alias gcl='git clone'
alias gs='git status'
alias gmerged='git branch --merged | grep -v '\*' | grep -v master | grep -v develop'
alias gclean='git branch --merged | grep -v '\*' | grep -v master | grep -v develop | xargs -t -n 1 git branch -d'

#
# Prompt colors
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

#
# Git branch in prompt.
#
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#
# Git status information
#
_git_prompt() {
    local git_status="`git status -unormal 2>&1`"

    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
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

_prompt_command() {
    PS1="`_git_prompt`${WHITE}\t ${LIGHT_CYAN}\u${GRAY}@${LIGHT_BLUE}\h ${YELLOW}\w${LIGHT_MAGENTA}\$(parse_git_branch)${GRAY} $ "
}
PROMPT_COMMAND=_prompt_command

PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/bin
PATH=/opt/local/bin:$PATH

export PATH
