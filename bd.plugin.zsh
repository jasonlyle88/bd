# Standardized $0 Handling
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Plugins Hash
# https://github.zshell.dev/docs/zsh/Zsh-Plugin-Standard.html#std-hash
typeset -gA Plugins
Plugins[BD_REPO_DIR]="${0:h}"

# Functions Directory
# https://wiki.zshell.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]]; then
    fpath+=( "${0:h}/functions" )
fi

autoload -Uz -- \
    .bd_get_pwd_parents \
    _bd \
    bd

compdef _bd bd
