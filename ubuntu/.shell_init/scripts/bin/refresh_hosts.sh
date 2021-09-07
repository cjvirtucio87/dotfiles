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
###  Refresh SSH entries for gitlab and caasd-portal-automation:
###    refresh_hosts gitlab.mitre.org caasd-portal-automation
###
###  Use a specific known_hosts file:
###    KNOWN_HOSTS="${HOME}/other_dir/known_hosts" refresh_hosts gitlab.mitre.org

set -e

KNOWN_HOSTS="${KNOWN_HOSTS:-"${HOME}/.ssh/known_hosts"}"
readonly KNOWN_HOSTS

function refresh_host {
  local host="$1"
  ssh-keygen -R "${host}"
  ssh-keyscan -H "${host}" >> ~/.ssh/known_hosts
}

function main {
  for host in "$@"; do
    echo "refreshing entry for ${host}"
    >&2 refresh_host "${host}"
    echo "done"
  done
}

main "$@"
