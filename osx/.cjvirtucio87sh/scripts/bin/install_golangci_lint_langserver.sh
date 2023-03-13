#!/usr/bin/env bash

set -eo pipefail

### Install golangci-lint-langserver.
###
### Options:
###   GOLANGCI_LINT_LS_VERSION: 1.39.4
###
### Usage:
###   <Options> install_golangci_lint_langserver.sh

readonly GOLANGCI_LINT_LS_VERSION="v0.0.7"
readonly GOLANGCI_LINT_LS_CHECKSUM=5fd2678c4fa417991a056ed7dc3b3286a68485fe745ead276ad965a09431e119
readonly VERSIONED_DIR="${HOME}/.golangci-lint-langserver/${GOLANGCI_LINT_LS_VERSION}"
readonly CURRENT_DIR="${HOME}/.golangci-lint-langserver/current"

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
    "https://github.com/nametake/golangci-lint-langserver/releases/download/${GOLANGCI_LINT_LS_VERSION}/golangci-lint-langserver_linux_x86_64.tar.gz"

  local tmp_file_checksum
  tmp_file_checksum="$(sha256sum < "${TMP_FILE}" | awk '{print $1}' | tr -d '\n')"

  if [[ "${GOLANGCI_LINT_LS_CHECKSUM}" != "${tmp_file_checksum}" ]]; then
    log "golangci-lint-langserver checksum mismatch; expected ${GOLANGCI_LINT_LS_CHECKSUM}, got ${tmp_file_checksum}"
    return 1
  fi

  local versioned_checksum_file="${VERSIONED_DIR}/.checksum"
  if [[ -f "${versioned_checksum_file}" ]]; then
    local versioned_checksum
    versioned_checksum="$(<"${versioned_checksum_file}")"

    if [[ "${GOLANGCI_LINT_LS_CHECKSUM}" == "${versioned_checksum}" ]]; then
      log "checksum matches; already installed"
      return
    fi
  fi

  tar \
    --extract \
    --gunzip \
    --file "${TMP_FILE}" \
    --directory "${VERSIONED_DIR}"

  if [[ -L "${CURRENT_DIR}" ]]; then
    log "unlinking ${CURRENT_DIR}"
    unlink "${CURRENT_DIR}"
  fi

  log "linking ${CURRENT_DIR} to ${VERSIONED_DIR}"
  echo -n "${GOLANGCI_LINT_LS_CHECKSUM}" > "${versioned_checksum_file}"
  ln -s "${VERSIONED_DIR}" "${CURRENT_DIR}"
}

main "$@"
