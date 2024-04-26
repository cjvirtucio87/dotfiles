vim.opt.termguicolors = true

-- disabling until I get cursor color sorted out
-- vim.opt.guicursor = 'n-v-c:block-Cursor,i-ci-ve:block-Cursor,r-cr-o:hor30-Cursor,a:blinkon100'

chinese_gold = '#cc9900'
green = '#08f742'
red = '#ff3300'

function autocmd_cursor_color_ev(ev_name, color)
  vim.api.nvim_create_autocmd(ev_name, {
    pattern = "*",
    callback = function()
      vim.api.nvim_set_hl(0, "Cursor", {fg=chinese_gold, bg=color})
      vim.api.nvim_set_hl(0, "CursorReset", {fg='white', bg='white'})
    end
  })
end

autocmd_cursor_color_ev("ColorScheme", red)
autocmd_cursor_color_ev("InsertEnter", green)
autocmd_cursor_color_ev("InsertLeave", red)

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = function()
      vim.opt.guicursor = 'a:ver25-CursorReset,a:blinkon100'
    end
})

vim.cmd[[colorscheme melange]]
