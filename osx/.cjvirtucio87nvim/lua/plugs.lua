vim.call('plug#begin', '~/.cjvirtucio87nvim-plugged')

local Plug = vim.fn['plug#']

Plug('savq/melange-nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
Plug('neovim/nvim-lspconfig')
Plug('chentoast/marks.nvim')

vim.call('plug#end')
