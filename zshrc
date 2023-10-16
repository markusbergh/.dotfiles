# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Aliases
if [ -f ~/.dotfiles/zsh_aliases ]; then
  source ~/.dotfiles/zsh_aliases
fi

# Homewbrew
eval "$(/opt/homebrew/bin/brew shellenv)"

#
# Load RVM into a shell session *as a function*
#
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# 
# ASDF
#
if [ -f ~/.asdf/asdf.sh ]; then
  . "$HOME/.asdf/asdf.sh"
# . "$HOME/.asdf/completions/asdf.bash"
fi

#
#   Setup colors for listing
#   ------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS="HxFxcxdxCxegedabagacad"

# Shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh-autocomplete
# source ~/.zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# zsh-autosuggestions
if [ -f ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
  ZSH_AUTOSUGGEST_STRATEGY=(completion history)
fi

# zsh-syntax-highlighting
if [ -f ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

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

    echo -n '\e[0;37;'"$ansi"';1m \e[0m '
  fi
}

# case insensitive completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'
# zstyle '*:compinit' arguments -D -i -u -C -w

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='╭─`_git_prompt`%F{white}%*%f %F{87}%n%f@%F{63}%m%f %F{yellow}%~%f %F{13}${vcs_info_msg_0_}%f${NEWLINE}╰─$ '
