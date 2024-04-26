require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },

  -- treesitter requirements
  -- see: https://stackoverflow.com/a/75092074
  ensure_installed = { 'c', 'help', 'vim' },
}
