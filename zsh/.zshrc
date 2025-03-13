# Prevent beeping
unsetopt beep

## History
HISTFILE=$XDG_CACHE_HOME/zsh/history
HISTSIZE=10000
SAVEHIST=10000

## Auto/Tab Complete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# keymap
bindkey -v
source $XDG_CONFIG_HOME/zsh/colemak.zsh

## Aliases
source $XDG_CONFIG_HOME/zsh/alias.zsh
source $XDG_CACHE_HOME/zsh/alias.zsh

# Starship
eval "$(starship init zsh)"

# fzf set up key bindings and fuzzy completion
source <(fzf --zsh)

## fzf settings
export FZF_DEFAULT_OPTS="
    --height 60%"
    bindkey '^F' fzf-cd-widget
export FZF_ALT_C_OPTS="
    --height 60%
    --style full
    --input-label ' Change Directory '
    --preview-window=hidden"
export FZF_CTRL_T_OPTS="
    --height 60%
    --style full
    --input-label ' Find Files '
    --preview-window=hidden"
export FZF_CTRL_R_OPTS="
    --height 60%
    --style full
    --reverse
    --input-label ' History '
    --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'"

## Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

## Theme
# Colors
export TERM=xterm-256color
autoload -Uz colors && colors
source $XDG_CONFIG_HOME/zsh/theme.zsh

