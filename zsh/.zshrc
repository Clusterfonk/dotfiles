## Plugins

## Theme
# Colors
export TERM=xterm-256color
autoload -Uz colors && colors
source $XDG_CONFIG_HOME/zsh/theme.zsh

## Plugin Settings

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

## Aliases
source $XDG_CONFIG_HOME/zsh/alias.zsh
source $XDG_CACHE_HOME/zsh/alias.zsh

## Keybinds
# vi mode
#bindkey -v

# keymap
source $XDG_CONFIG_HOME/zsh/colemak.zsh

# Starship
eval "$(starship init zsh)"
