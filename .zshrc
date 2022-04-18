setopt extendedglob
unsetopt extendedglob

fpath=("$HOME/.zsh_completions/src" $fpath)
autoload compinit && compinit

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

source $HOME/.zsh_aliases
setopt NO_NOMATCH
path+="$HOME/.local/bin"
eval "$(starship init zsh)"
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
export GPG_TTY=$(tty)
export DIRENV_LOG_FORMAT=
eval "$(direnv hook zsh)"
