local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- see: https://github.com/neovim/nvim-lspconfig/tree/4bb0f1845c5cc6465aecedc773fc2d619fcd8faf#suggested-configuration
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- nvim-cmp lspconfig setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.omnisharp.setup {
  cmd = { os.getenv("HOME") .. "/.omnisharp/current/OmniSharp" },
  on_attach = on_attach
}

require'lspconfig'.golangci_lint_ls.setup {
  cmd = { os.getenv("HOME") .. "/.golangci-lint-langserver/current/golangci-lint-langserver" },
}

require'lspconfig'.ruby_lsp.setup {}

require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities -- using nvim-cmp capabilities here
}

require'lspconfig'.kotlin_language_server.setup {}

require'lspconfig'.gradle_ls.setup {}

require'lspconfig'.terraform_lsp.setup {}
