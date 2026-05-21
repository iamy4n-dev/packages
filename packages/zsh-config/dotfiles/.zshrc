export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

autoload -Uz compinit && compinit

# zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# atuin
if command -v atuin &>/dev/null; then
    eval "$(atuin init zsh)"
fi

# starship
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi
