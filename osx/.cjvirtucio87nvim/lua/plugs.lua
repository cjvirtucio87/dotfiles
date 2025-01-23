vim.call('plug#begin', '~/.cjvirtucio87nvim-plugged')

local Plug = vim.fn['plug#']

Plug('shaunsingh/nord.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
Plug('neovim/nvim-lspconfig')
Plug('chentoast/marks.nvim')
Plug('klen/nvim-config-local')
-- ChatGPT and deps
Plug('MunifTanjim/nui.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('folke/trouble.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('jackMort/ChatGPT.nvim')

vim.call('plug#end')
