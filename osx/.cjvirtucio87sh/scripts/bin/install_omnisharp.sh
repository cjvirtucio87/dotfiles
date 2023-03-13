#!/usr/bin/env bash

set -eo pipefail

### Install omnisharp.
###
### Options:
###   OMNISHARP_VERSION: 1.39.4
###
### Usage:
###   <Options> install_omnisharp.sh

readonly OMNISHARP_VERSION="1.39.4"
readonly OMNISHARP_CHECKSUM=84299e917cdfdbd9540da9506bee6e7b9a35ca3958e12ec12c19a3ec36a51ff5
readonly VERSIONED_DIR="${HOME}/.omnisharp/${OMNISHARP_VERSION}"
readonly CURRENT_DIR="${HOME}/.omnisharp/current"

function cleanup {
  log "cleaning up"
  if [[ -n "${TMP_FILE}" ]]; then
    rm -f "${TMP_FILE}"
  fi
  log "done cleaning up"
}

function help {
  local line
  while read -r line; do
    if [[ "${line}" =~ ^### ]]; then
      # shellcheck disable=SC2001
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
  TMP_FILE="$(mktemp --suffix '.tar.gz')"
  trap cleanup EXIT

  curl \
    --location \
    --output "${TMP_FILE}" \
    "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${OMNISHARP_VERSION}/omnisharp-linux-x64-net6.0.tar.gz" \

  local tmp_file_checksum
  tmp_file_checksum="$(sha256sum < "${TMP_FILE}" | awk '{print $1}' | tr -d '\n')"

  if [[ "${OMNISHARP_CHECKSUM}" != "${tmp_file_checksum}" ]]; then
    log "OmniSharp checksum mismatch; expected ${OMNISHARP_CHECKSUM}, got ${tmp_file_checksum}"
    return 1
  fi

  local versioned_checksum_file="${VERSIONED_DIR}/.checksum"
  if [[ -f "${versioned_checksum_file}" ]]; then
    local versioned_checksum
    versioned_checksum="$(<"${versioned_checksum_file}")"

    if [[ "${OMNISHARP_CHECKSUM}" == "${versioned_checksum}" ]]; then
      log "checksum matches; already installed"
      return
    fi
  fi

  tar \
    --extract \
    --gunzip \
    --file "${TMP_FILE}" \
    --directory "${VERSIONED_DIR}" \
    .

  if [[ -L "${CURRENT_DIR}" ]]; then
    log "unlinking ${CURRENT_DIR}"
    unlink "${CURRENT_DIR}"
  fi

  log "linking ${CURRENT_DIR} to ${VERSIONED_DIR}"
  echo -n "${OMNISHARP_CHECKSUM}" > "${versioned_checksum_file}"
  ln -s "${VERSIONED_DIR}" "${CURRENT_DIR}"
}

main "$@"
