vim.opt.termguicolors = true

-- cursor style
vim.opt.guicursor = 'n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor,a:blinkon100'

function hiCursor() 
  vim.api.nvim_set_hl(0, "Cursor", {fg='#cc9900', bg='#339966'})
  vim.api.nvim_set_hl(0, "CursorReset", {fg='white', bg='white'})
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = hiCursor,
})

function resetHi()
  vim.opt.guicursor = 'a:ver25-CursorReset,a:blinkon100'
end

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = resetHi, 
})
