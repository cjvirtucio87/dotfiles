# cjvirtucio87 dotfiles

My dotfiles for development. Typically installed using [GNU stow](https://www.gnu.org/software/stow/).

## Setup

1. Install `GNU Stow`.
1. Run these commands:
    ```bash
    cd path/to/dotfiles
    stow ubuntu
    . "${HOME}/.shell_init/index.sh"
    install_vim_plug.sh
    ```

This will install the dotfiles, as well as `vim-plug`. You will then need to run `:PlugInstall` when opening
`vim` for the first time.
