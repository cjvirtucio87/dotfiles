#!/usr/bin/env bash

set -eo pipefail

### Install omnisharp.
###
### Options:
###   OMNISHARP_VERSION: 1.39.4
###
### Usage:
###   <Options> install_omnisharp.sh

OMNISHARP_VERSION="${OMNISHARP_VERSION:-1.39.4}"
readonly OMNISHARP_VERSION
readonly VERSIONED_DIR="${HOME}/.omnisharp/${OMNISHARP_VERSION}"
readonly CURRENT_DIR="${HOME}/.omnisharp/current"

function help {
  local line
  while read -r line; do
    if [[ "${line}" =~ ^### ]]; then
      sed 's,^###,,g' <<<"${line}"
    fi
  done < "$0"
}

function log {
  >&2 printf '[%s] %s\n' "$(date -Iseconds)" "$1"
}

function main {
  if [[ "$1" =~ help ]]; then
    help | less
    return 1
  fi
    
  mkdir -p "${VERSIONED_DIR}"

  log "installing ${VERSIONED_DIR}"
  curl \
    --location \
    "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${OMNISHARP_VERSION}/omnisharp-linux-x64-net6.0.tar.gz" \
    | tar \
        --extract \
        --gunzip \
        --directory "${VERSIONED_DIR}" \
        .

  if [[ -L "${CURRENT_DIR}" ]]; then
    log "unlinking ${CURRENT_DIR}"
    unlink "${CURRENT_DIR}"
  fi

  log "linking ${CURRENT_DIR} to ${VERSIONED_DIR}"
  ln -s "${VERSIONED_DIR}" "${CURRENT_DIR}"
}

main "$@"
