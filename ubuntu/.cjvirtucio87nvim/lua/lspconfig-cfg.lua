local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- see: https://github.com/neovim/nvim-lspconfig/tree/4bb0f1845c5cc6465aecedc773fc2d619fcd8faf#suggested-configuration
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require'lspconfig'.omnisharp.setup {
  cmd = { os.getenv("HOME") .. "/.omnisharp/current/OmniSharp" },
  on_attach = on_attach
}