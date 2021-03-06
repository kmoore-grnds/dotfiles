#!/bin/bash

# Make History last forever - keep history in folders by Y/M/Day_host
# Thanks to - https://twitter.com/michaelhoffman https://twitter.com/michaelhoffman/status/639178145673932800
mkdir -p "${HOME}/.history/$(date -u +%Y/%m/)"
HOSTNAME_SHORT=`hostname -s`
export PROMPT_COMMAND='history -a'
HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"

#null out history and history file size so that we're guanranteed to retain everything
HISTSIZE=
HISTFILESIZE=

if [[ `uname` == 'Darwin' ]]; then
	# OSX Sierra & Later have a built in session history mgmt that conflicts with our schema
	# if we're on OSX disable the system history magic
	touch "${HOME}/.bash_sessions_disable"
fi

#Searches through our heirarchal history schema as well as current shell history
histgrep () {
    grep -i "$@" $(gfind ~/.history -type f -printf "%p\n" | sort -n)
    # grep -ir "$@" ~/.history
    history | grep -i "$@"
}
export -f histgrep
