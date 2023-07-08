-- nvim-tree
-- see: https://github.com/nvim-tree/nvim-tree.lua#setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

-- clipboard
if vim.fn.has("wsl") == 1 then
  if vim.fn.executable("wl-copy") == 0 then
    print("wsl-clipboard not found; clipboard integration will not work")
  else
    vim.g.clipboard = {
      name = "wl-clipboard (wsl)",
      copy = {
        ["+"] = "wl-copy --foreground --type text/plain",
        ["*"] = "wl-copy --foreground --primary --type text/plain",
      },
      paste = {
        ["+"] = (function()
          return vim.fn.systemlist('wl-paste --no-newline | sed -e "s/\r$//"', {''}, 1)
        end),
        ["*"] = (function()
          return vim.fn.systemlist('wl-paste --primary --no-newline | sed -e "s/\r$//"', {''}, 1)
        end)
      },
      cache_enabled = true
    }
  end
else
  vim.g.clipboard = unnamedplus
end

-- nvim-tree toggle
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {})
