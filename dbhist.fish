
##*********************************************
##*********************************************
##
##	History via SQLITE3
##
## This file must be sourced from somewhere 
## within the usual FISH startup file. Usually
## the ~/.config/fish/config.fish file.
##
if status is-interactive
	set -gx SHELL "/usr/bin/fish"
	set -gx DBHISTFILE "DDDDDDDDDDDD$DBHISTMODIFIER"
	# Generates a unique session ID for dbhist. This is used to tie command to a specific session when querying history. 
	# It only needs to be generated once per interactive session. If one sources this file after a session has already been started, 
	# a new DBHISTGUID will be generated.
	#
	# The first portion of the DBHISTGUID is the current epoch time (in seconds). This is so that sesison ids will generally be sortable 
	# (close enough, but not really).
	set -gx DBHISTGUID (date "+%s")_(random)(random)

	alias history 'dbhist'

	function dbhist_preexec --on-event fish_preexec
		set cdate (date '+%Y%m%d%H%M%S')
		set me (whoami)
		#echo "dbhistoryinsert \"$DBHISTFILE\" \"$HOSTNAME\" \"$DBHISTGUID\" \"$SHELL\" \"$me\" \"$cdate\" \"$argv\" \"$argv\"" 
		dbhistinsert $DBHISTFILE $HOSTNAME $DBHISTGUID $SHELL $me $cdate $argv $argv "$PWD" &; disown
	end
end

