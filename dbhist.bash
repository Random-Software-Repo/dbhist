
export DBHISTFILE=DDDDDDDDDDDD${DBHISTMODIFIER}.db
export BGUID="$(date "+%s")_${RANDOM}${RANDOM}"


dbhist_preexec ()
{
	(dbhistinsert "${DBHISTFILE}" "${HOSTNAME}" "${BGUID}" "/usr/bin/bash" "$(whoami)" "$(date '+%Y%m%d%H%M%S')" "${1}" "${1}" "${PWD}"&)
}
preexec_functions+=(dbhist_preexec)
alias history='dbhist'
