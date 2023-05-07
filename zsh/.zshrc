## Plugins
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

## Theme 
# Colors
export TERM=xterm-256color
autoload -Uz colors && colors
source $XDG_CONFIG_HOME/zsh/theme.zsh

## Plugin Settings
# zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_REPLACE_ESCAPE_BINDKEY=jk
ZVM_VI_VISUAL_ESCAPE_BINDKEY=jk
ZVM_VI_OPPEND_ESCAPE_BINDKEY=jk

ZVM_CURSOR_STYLE_ENABLED=false

# Prevent beeping
unsetopt beep


## History
HISTFILE=$XDG_CACHE_HOME/zsh/history
HISTSIZE=10000
SAVEHIST=10000


## auto/tab complete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


## Aliases
source $XDG_CACHE_HOME/zsh/alias

## Keybinds
# vi mode
bindkey -v
export KEYTIMEOUT=1

# vim in tab menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
