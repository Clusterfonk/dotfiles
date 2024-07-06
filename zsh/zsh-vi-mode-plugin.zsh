function zvm_config() {
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
    ZVM_VI_INSERT_ESCAPE_BINDKEY=,.
    ZVM_VI_REPLACE_ESCAPE_BINDKEY=,.
    ZVM_VI_VISUAL_ESCAPE_BINDKEY=,.
    ZVM_VI_OPPEND_ESCAPE_BINDKEY=,.
}

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
