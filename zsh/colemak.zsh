#!/bin/sh
bindkey '^r' .history-incremental-search-backward

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

bindkey -M vicmd "a" vi-insert
bindkey -M vicmd "A" vi-insert-bol
bindkey -M vicmd "t" vi-add-next
bindkey -M vicmd "T" vi-add-eol

bindkey -M vicmd "h" vi-repeat-search
bindkey -M vicmd "H" vi-rev-repeat-search

bindkey -s ^l "tmux-sessionizer.sh\n"
bindkey -s ^a "tmux a\n"

export FZF_FULL="--height 60% --style full --preview-window=hidden"
bindkey -s '^e' "find ~/Projects/ -type f | fzf $FZF_FULL --bind 'enter:become(nvim {})' --input-label ' Nvim '\n"
