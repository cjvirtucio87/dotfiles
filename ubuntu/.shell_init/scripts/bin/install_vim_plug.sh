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

function main {
  curl \
    --location \
    --output "${HOME}/.vim/autoload/plug.vim" \
    --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/${VIM_PLUG_VERSION}/plug.vim"
}

main
