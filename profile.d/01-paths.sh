#!/bin/bash

function prefix_path { # add a prefix to the path if it exists and isn't already in the path {{{
    [[ ! "$PATH" =~ "$1" && -e "$1" ]] && export PATH="${1}:${PATH}"
} # }}}

function suffix_path { # add a suffix to the path if it exists and isn't already in the path {{{
    [[ ! "$PATH" =~ "$1" && -e "$1" ]] && export PATH="${PATH}:${1}"
} # }}}

#Add some default locations to the exec path
prefix_path "/usr/local/bin"
# prefix_path "/usr/local/opt/python/libexec/bin"
prefix_path "${HOME}/bin"
suffix_path "/usr/local/sbin"
suffix_path "/usr/local/opt/openssl/bin"
suffix_path "${CORP_HOME}/arcanist/arcanist/bin"
# prefix_path "${CORP_HOME}/ops-tools/bin"
