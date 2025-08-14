vim.opt.termguicolors = true

vim.opt.guicursor = 'n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor,a:blinkon100'

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      vim.api.nvim_set_hl(0, "Cursor", {fg='#cc9900', bg='#ff3300'})
      vim.api.nvim_set_hl(0, "CursorReset", {fg='white', bg='white'})
    end
})

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = function()
      vim.opt.guicursor = 'a:ver25-CursorReset,a:blinkon100'
    end
})

vim.cmd("colorscheme nord")
require('lualine').setup{
  sections = {
    lualine_a = {
      {
        'filename',
        path = 3
      }
    },
  },
}
vim.api.nvim_set_hl(0, "LineNr", { fg = "#FFFFFF" })
