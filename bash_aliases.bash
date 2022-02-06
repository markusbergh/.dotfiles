#
#   Startup and user specific
#   ------------------------------------------------------------
alias reload="source ~/.bash_profile"

#   Paths
#   ------------------------------------------------------------
export PATH="$PATH:/opt/local/bin:/usr/local/sbin"

#   Set default blocksize for ls, df, du
#   ------------------------------------------------------------
export BLOCKSIZE=1k

#
#   Include colors when listing
#   ------------------------------------------------------------
alias ls="ls -G"

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
alias mylocalip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ipen0='ipconfig getpacket en0'

#   xcodebuild helper
#   ------------------------------------------------------------
#
alias xcoderun="~/.dotfiles/xcoderun.sh"
