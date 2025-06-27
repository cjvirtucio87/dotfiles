vim.call('plug#begin', '~/.cjvirtucio87nvim-plugged')

local Plug = vim.fn['plug#']

Plug('jacoborus/tender.vim')
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

-- avante and deps
Plug('stevearc/dressing.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('MunifTanjim/nui.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('nvim-tree/nvim-web-devicons')
Plug('HakonHarnes/img-clip.nvim')
Plug('zbirenbaum/copilot.lua')
Plug('yetone/avante.nvim', {['branch'] = 'main', ['do'] = 'make' })

-- Plug('github/copilot.vim')
Plug('CopilotC-Nvim/CopilotChat.nvim')

-- autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'dcampos/nvim-snippy'

vim.call('plug#end')
