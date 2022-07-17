#!/bin/sh

#
autoload -Uz vcs_info
autoload -U colors && colors
zstyle ':vcs_info:*' enable git


#
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst


normal='%B%{$fg[white]%}>%b%{$reset_color%}'
insert='%B%{$fg[blue]%}>%b%{$reset_color%}'
visual='%B%{$fg[yellow]%}>%b%{$reset_color%}'
replace='%B%{$fg[cyan]%}>%b%{$reset_color%}'

mode_hist=($insert $insert $insert)

function shift_mode_hist {
    if [ $mode_hist[1] != "$1" ]; then
        mode_hist[3]=$mode_hist[2]
        mode_hist[2]=$mode_hist[1]
    fi
}

RPROMPT=''

# CALLBACK
function zvm_after_select_vi_mode {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
      shift_mode_hist $normal
      mode_hist[1]=$normal
    ;;
    $ZVM_MODE_INSERT)
      shift_mode_hist $insert
      mode_hist[1]=$insert
    ;;
    $ZVM_MODE_VISUAL)
      shift_mode_hist $visual
      mode_hist[1]=$visual
    ;;
    $ZVM_MODE_VISUAL_LINE)
      shift_mode_hist $visual
      mode_hist[1]=$visual
    ;;
    $ZVM_MODE_REPLACE)
      shift_mode_hist $replace
      mode_hist[1]=$replace
    ;;
  esac
  PS1='%B%{$fg[yellow]%}%n:%{$reset_color%}' 
  PS1+=' %2~ '
  PS1+=$mode_hist[1]
  PS1+=' '
}

