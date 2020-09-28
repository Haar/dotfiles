set -o vi

eval "$(z.lua --init zsh once enhanced fzf)"

fpath=(
  /usr/local/share/zsh/site-functions
  $fpath
)

alias j=z
function jj() {
  cd "$(z | sort -k1gr | sed 's/[^ ]*//' | tr -d ' ' | fzf)"
}

alias rake='noglob rake'

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^[[Z' reverse-menu-complete

setopt PROMPT_SUBST

# Unbreak broken, non-colored terminal
alias ls='ls -G'
alias ll='ls -lG'

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'

# Usage: find_and_replace foo bar
function find_and_replace() {
  ack -l "$1" | xargs perl -pi -E "s/$1/$2/g"
}

alias vi='nvim'
alias vim=vi
export EDITOR=nvim

unsetopt AUTO_NAME_DIRS

alias gitx="open -a /Applications/GitX.app ."
alias :e=vi
alias :q="echo YOU FAIL"
alias ..="cd .."

. $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

source ~/.kubectl_aliases

export GOPATH=$HOME/go

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$(asdf where rust)/bin
export PATH="$(asdf where nodejs)/.npm/bin:$PATH"
