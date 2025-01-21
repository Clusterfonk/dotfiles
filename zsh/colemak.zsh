#!/bin/sh

bindkey -M vicmd 'm' vi-backward-char
bindkey -M vicmd 'n' down-line-or-history
bindkey -M vicmd 'e' up-line-or-history
bindkey -M vicmd 'i' vi-forward-char
bindkey -M vicmd 'I' vi-forward-char

bindkey -M visual 'm' vi-backward-char
bindkey -M visual 'n' down-line-or-history
bindkey -M visual 'e' up-line-or-history
bindkey -M visual 'i' vi-forward-char
bindkey -M visual 'I' vi-forward-char

bindkey -M isearch 'm' vi-backward-char
bindkey -M isearch 'n' down-line-or-history
bindkey -M isearch 'e' up-line-or-history
bindkey -M isearch 'i' vi-forward-char
bindkey -M isearch 'I' vi-forward-char

bindkey -M vicmd '^i' vi-forward-word-end
bindkey -M vicmd 'I' vi-forward-blank-word-end
bindkey -M vicmd '^m' vi-backward-word-end
bindkey -M vicmd 'M' vi-backward-blank-word-end

bindkey -M menuselect 'n' forward-one-line
bindkey -M menuselect 'e' backward-one-line
