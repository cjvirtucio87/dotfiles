#!/usr/bin/env bash

### Refresh the SSH entry in known_hosts for a host.
### Particularly useful for an environment where the IP
### addresses of commonly accessed hosts constantly change.
###
### Usage:
###  <Options> refresh_hosts <Arguments>
###
### Arguments:
###  hosts: a variable number of hosts to refresh
###
### Options:
###  KNOWN_HOSTS: The known_hosts file to manage (default: "${HOME}/.ssh/known_hosts")
###
### Examples:
###  Refresh SSH entries for host-a.corporate.org and host-b.corporate.org:
###    refresh_hosts host-a.corporate.org host-b.corporate.org
###
###  Use a specific known_hosts file:
###    KNOWN_HOSTS="${HOME}/other_dir/known_hosts" refresh_hosts some-host

set -e

KNOWN_HOSTS="${KNOWN_HOSTS:-"${HOME}/.ssh/known_hosts"}"
readonly KNOWN_HOSTS

function refresh_host {
  local host="$1"
  local removal_output=''
  while [[ ! "${removal_output}" =~ 'not found' ]]; do
    if ! removal_output="$(ssh-keygen -R "${host}" 2>&1)"; then
      >&2 echo "error!"
      >&2 echo "${removal_output}"
      return 1
    fi

    removal_output="$(printf '%s' "${removal_output}" | grep 'not found')"
    sleep 1
  done

  local refresh_output
  if ! refresh_output="$(ssh-keyscan -H "${host}" 2>&1)"; then
    >&2 echo "${refresh_output}"
    >&2 echo "failed to refresh host, ${host}"
    return 1
  fi

  if [[ "${refresh_output}" =~ 'Name or service not known' ]]; then
    >&2 echo "${refresh_output}"
    >&2 echo "failed to refresh host, ${host}"
    return 1
  fi

  printf '%s' "${refresh_output}" >> "${KNOWN_HOSTS}"
}

function main {
  local hosts=("$@")

  for host in "${hosts[@]}"; do
    echo "refreshing entry for ${host}"
    if ! refresh_host "${host}"; then
      return 1
    fi

    echo "done"
  done
}

main "$@"
