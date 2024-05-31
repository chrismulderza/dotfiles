# Bash tools configuration         -*- shell-script -*-

# Helper functions for gcalcli

# Test if `gcalcli` is on the path 

if [ -x "$(which gcalcli)" ]; then 

  pfl_gcalcli_day_start_time="07:00:00"
  pfl_gcalcli_day_end_time="18:00:00"
  pfl_gcalcli_date=$(date +'%Y-%m-%d')

  if [ $# -gt 0 ]; then
    pfl_gcalcli_date=$(date --date=${1} +'%Y-%m-%d')
  fi


  if [ ! -z ${pfl_obsidian_date+x} ]; then
    pfl_gcalcli_date=$(date --date=${pfl_obsidian_date} +'%Y-%m-%d')
  fi


  # Agenda for the day
  agendad() {
    local opts="--military --tsv"
    local startdate=${pfl_gcalcli_date}
    local enddate=${pfl_gcalcli_date}
    local starttime=${pfl_gcalcli_day_start_time}
    local endtime=${pfl_gcalcli_day_end_time}
    # we hack this into an ISO format
    # TODO: calculate this period using pure GNU date directives
    local period="'${startdate}T${starttime}' '${enddate}T${endtime}'"
    local cmd="$(which gcalcli) agenda ${opts} ${period}"
    ${cmd}
  }

  # Agenda for the week
  agendaw() {
    local opts="--military --nostarted"
    local startdate=$(date -dmonday +'%Y-%m-%d')
    local enddate=$(date -dsunday +'%Y-%m-%d')
    local starttime=${pfl_gcalcli_day_start_time}
    local endtime=${pfl_gcalcli_day_end_time}
    # we hack this into an ISO format
    # TODO: calculate this period using pure GNU date directives
    local period="'${startdate}T${starttime}' '${enddate}T${endtime}'"
    local cmd="$(which gcalcli) agenda ${opts} ${period}"
    ${cmd}
  }

  # Agenda for the month
  agendam() {
    local opts="--military --nostarted"
    local startdate=$(date +'%Y-%m-01')
    local enddate=$(date -d "`date +%Y%m01` +1 month -1 day" +%Y-%m-%d)
    local starttime=${pfl_gcalcli_day_start_time}
    local endtime=${pfl_gcalcli_day_end_time}
    # we hack this into an ISO format
    # TODO: calculate this period using pure GNU date directives
    local period="'${startdate}T${starttime}' '${enddate}T${endtime}'"
    local cmd="$(which gcalcli) agenda ${opts} ${period}"
    ${cmd}
  }

  agendad | awk -F '\t' '{ print $2"-"$4" "$5}'

else
  return
fi

# ex: ts=2 sw=2 et filetype=sh
