#!/bin/zsh
#
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave-beta"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
source $XDG_CONFIG_HOME/user-dirs.dirs

export XAUTHORITY="$XDG_CONFIG_HOME/X11/Xauthority"

export LESSHISTFILE="-"

export MANPAGER='nvim +Man!'
export MANWIDTH=999
