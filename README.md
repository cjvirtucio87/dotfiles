# cjvirtucio87 dotfiles

My dotfiles for development. Typically installed using [GNU stow](https://www.gnu.org/software/stow/).

## Setup

1. Install `GNU Stow`.
1. Run these commands to install the dotfiles and `vim-plug`:
    ```bash
    cd path/to/dotfiles
    stow ubuntu
    . "${HOME}/.shell_init/index.sh"
    install_vim_plug.sh
    ```
1. Add this to your `.bash_profile`:
    ```bash
    # sourcing shell_init scripts
    . "${HOME}/.shell_init/index.sh"
    ```
1. Add this to your `.vimrc`:
    ```bash
    # sourcing custom vimrc
    source ~/.cjvirtucio87vimrc
    ```
1. Open a file with `vim` and run `:PlugInstall`.

This should give you a complete setup with all the dotfiles and custom vim configs from this project.

