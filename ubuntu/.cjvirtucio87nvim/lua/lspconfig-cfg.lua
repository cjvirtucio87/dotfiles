require'lspconfig'.omnisharp.setup {
  cmd = { os.getenv("HOME") .. "/.omnisharp/current/OmniSharp" }
}
