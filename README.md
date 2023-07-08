# cjvirtucio87 dotfiles

My dotfiles for development. Typically installed using [GNU stow](https://www.gnu.org/software/stow/).

## Setup

1. Install `GNU Stow`.
1. Run these commands to install the dotfiles and `vim-plug`:
    ```bash
    cd path/to/dotfiles
    stow ubuntu
    . "${HOME}/.shell_init/index.sh"
    # FLAVOR defaults to vim (supported: vim, nvim)
    FLAVOR=nvim install_vim_plug.sh
    ```
1. Add this to your `.bash_profile`:
    ```bash
    # sourcing shell_init scripts
    . "${HOME}/.shell_init/index.sh"
    # setting EDITOR to desired flavor of vi/vim/nvim
    export EDITOR=<flavor>
    ```
1. Configure either `vim` or `nvim`:
    1. For `vim`, Add this to your `.vimrc`:
    ```bash
    # sourcing custom vimrc
    source ~/.cjvirtucio87vimrc
    ```
    1. For `nvim`, Add this to your `.config/nvim/init.vim`:
    ```bash
    set runtimepath^=~/.cjvirtucio87nvim
    lua require('main')
    ```
1. Open a file with `vim` and run `:PlugInstall`.

This should give you a complete setup with all the dotfiles and custom vim configs from this project.

