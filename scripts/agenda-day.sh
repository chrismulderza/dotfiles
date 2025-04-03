# Bash tools configuration         -*- shell-script -*-

# Helper functions for gcalcli

CMD=/opt/homebrew/bin/gcalcli
export GCALCLI_CONFIG=~/.config/gcalcli/config.toml

pfl_gcalcli_day_start_time="07:00:00"
pfl_gcalcli_day_end_time="18:00:00"
pfl_gcalcli_date=$(/opt/homebrew/bin/gdate +'%Y-%m-%d')

if [ $# -gt 0 ]; then
  pfl_gcalcli_date=$(date --date=${1} +'%Y-%m-%d')
fi


if [ ! -z ${pfl_obsidian_date+x} ]; then
  pfl_gcalcli_date=$(/opt/homebrew/bin/gdate --date=${pfl_obsidian_date} +'%Y-%m-%d')
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
  local cmd="${CMD} agenda ${opts} ${period}"
  ${cmd}
}

#agendad | awk -F '\t' '{ print $2"-"$4" "$5}'
agendad | awk -F '\t\' 'NR>1' | awk -F '\t' '$2!="" { print $2"-"$4" "$5 }'


# ex: ts=2 sw=2 et filetype=sh
