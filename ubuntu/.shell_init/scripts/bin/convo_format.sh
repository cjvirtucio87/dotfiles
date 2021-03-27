#!/bin/bash

set -e

### A simple script to format conversations for JIRA.
###
### Arguments:
###   filepath: the path to the file containing the conversation to format
###   convo_medium: the conversation's medium (slack|email)
###
### Usage:
###   convo_format.sh '/tmp/convo.txt' 'email'

function main {
  local filepath="$1"; shift
  local convo_medium="$1"; shift

  if [[ -z "${filepath}" ]] || [[ -z "${convo_medium}" ]]; then
    >&2 echo "Invalid arguments (filepath: ${filepath}, convo_medium: ${convo_medium})"
    exit 1
  fi

  local regex_pattern
  case "${convo_medium}" in
    'email')
      regex_pattern='^(From|Sent|To|Subject):'
      ;;
    'slack')
      regex_pattern='(^[a-zA-Z :_\(\)]+([0-9]{0,1}[0-9]:[0-9][0-9] [AP]M$|[><]{0,1} [0-9] (year|month|day|hour|minute|second)s{0,1} ago)$)'
      ;;
    *)
      ;;
  esac

  sed --regexp-extended "s/${regex_pattern}/*\1*/g" "${filepath}"
}

main "$@"
