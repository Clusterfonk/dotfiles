#!/bin/sh

ZVM_VI_INSERT_ESCAPE_BINDKEY=,.
ZVM_VI_REPLACE_ESCAPE_BINDKEY=,.
ZVM_VI_VISUAL_ESCAPE_BINDKEY=,.
ZVM_VI_OPPEND_ESCAPE_BINDKEY=,.

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

bindkey -M vicmd 'k' vi-forward-word-end
bindkey -M vicmd 'K' vi-forward-blank-word-end
