setopt extendedglob
autoload -Uz compinit
for dump in $HOME/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
unsetopt extendedglob

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

source $HOME/.zsh_aliases
setopt NO_NOMATCH
path+=("$HOME/.local/bin")
eval "$(starship init zsh)"
fpath=("$HOME/completions/src" $fpath)
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
export GPG_TTY=$(tty)
alias vim="nvim"
eval "$(pyenv init -)"
