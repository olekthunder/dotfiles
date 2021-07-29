setopt extendedglob
autoload -Uz compinit
for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
unsetopt extendedglob

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

source $ZDOTDIR/.zsh_aliases
setopt NO_NOMATCH
path+=("$HOME/.local/bin")
eval "$(starship init zsh)"
fpath=("$ZDOTDIR/completions/src" $fpath)

