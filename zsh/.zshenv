#!/bin/zsh
#
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave-beta"
export GIT_EDITOR=$EDITOR

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
source $XDG_CONFIG_HOME/user-dirs.dirs

export XAUTHORITY="$XDG_CONFIG_HOME/X11/Xauthority"

# declutter home dir
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

export _JAVA_OPTIONS="
-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java/.userPrefs
-Djava.util.prefs.systemRoot=$XDG_CONFIG_HOME/java/.systemPrefs
-Djava.io.tmpdir=$XDG_CACHE_HOME/java"

export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nvidia"

export LESSHISTFILE="-"

export MANPAGER='nvim +Man!'
export MANWIDTH=999
