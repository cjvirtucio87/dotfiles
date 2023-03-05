#!/usr/bin/env bash

set -e

### Install vim-plug.
###
### Options:
###   VIM_PLUG_VERSION: master
###
### Usage:
###   <Options> install_vim_plug.sh

VIM_PLUG_VERSION="${VIM_PLUG_VERSION:-master}"
readonly VIM_PLUG_VERSION
# shellcheck disable=SC2034
readonly VIM_AUTOLOAD_DIR="${HOME}/.vim/autoload"
# shellcheck disable=SC2034
readonly NVIM_AUTOLOAD_DIR="${HOME}/.local/share/nvim/site/autoload"
readonly FLAVOR="${FLAVOR:-vim}"
readonly AUTOLOAD_DIR_VAR="${FLAVOR^^}_AUTOLOAD_DIR"
readonly AUTOLOAD_DIR="${!AUTOLOAD_DIR_VAR}"

function main {
  if [[ -z "${AUTOLOAD_DIR}" ]]; then
    >&2 echo "FLAVOR [${FLAVOR}] is invalid"
    return 1
  fi

  >&2 echo "using AUTOLOAD_DIR: ${AUTOLOAD_DIR}"
  mkdir -p "${AUTOLOAD_DIR}"
  curl \
    --location \
    --output "${AUTOLOAD_DIR}/plug.vim" \
    --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/${VIM_PLUG_VERSION}/plug.vim"
}

main
