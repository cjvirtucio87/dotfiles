#!/usr/bin/env bash

### hide_nvim_parser_dir.sh
###
### Hide the default nvim parser directory.
###
### Usage:
###
###   hide_nvim_parser_dir.sh
###
### Examples:
###
###   # print this help message
###   hide_nvim_parser_dir.sh help
###
### Remarks:
### 
###   This is needed for treesitter to work. See: https://github.com/nvim-treesitter/nvim-treesitter/issues/3970#issuecomment-1353836834

set -e

function help {
  local line
  while read -r line; do
    if [[ "${line}" =~ ^### ]]; then
      echo "${line/###/}" <<<"${line}"
      continue
    fi
  done < "$0"
}

function log {
  >&2 printf '[%s] %s\n' "$(date -Iseconds)" "$1"
}

function main {
  if [[ "$1" =~ help ]]; then
    help
    return 1
  fi

  local install_dir
  install_dir="$(asdf where neovim | tr -d '\n')"

  local parser_dir="${install_dir}/lib/nvim/parser"
  if ! [[ -d "${parser_dir}" ]]; then
    log "already hidden; doing nothing"
    return
  fi

  log "hiding default parser dir for nvim-treesitter lua/vim parsers to work"
  mv "${parser_dir}" "${parser_dir}.hidden"
}

main "$1"
