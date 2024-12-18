
##*********************************************
##*********************************************
##
##	History via SQLITE3
##
## This file must be sourced from somewhere 
## within the usual ZSH startup files. Usually
## the ~/.zshrc file should be acceptable.
##

function dbhist_preexec
{
	##echo "zshhistoryinsert ~/.zshhistory.db \"${HOSTNAME}\" \"${ZGUID}\" \"${SHELL}\" \"${typedcommand}\" \"${actualcommand}\" \"${1}\"" 
	( dbhistinsert "${DBHISTFILE}" "${HOSTNAME}" "${DBHISTGUID}" "${SHELL}" "$(whoami)" $(date '+%Y%m%d%H%M%S') "${1}" "${2}" "${PWD}"&)
}

export DBHISTFILE=DDDDDDDDDDDD${DBHISTMODIFIER}.db
# Generates a unique session ID for zb.history. This is used to tie command to a specific session when querying history. 
# It only needs to be generated once per interactive session. If one sources this file after a session has already been started, 
# a new DBHISTGUID will be generated.
#
# The first portion of the DBHISTGUID is the current epoch time (in seconds). This is so that sesison ids will generally be sortable 
# (close enough, but not really).
export DBHISTGUID="$(date "+%s")_${RANDOM}${RANDOM}"

alias history=dbhist
add-zsh-hook preexec dbhist_preexec

