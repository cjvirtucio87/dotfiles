vim.opt.encoding = "utf-8"

-- indentation for specific file types
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "cs",
    callback = function()
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
      vim.opt.shiftwidth = 4
      vim.opt.expandtab = true
    end
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "go",
    callback = function()
      vim.opt.tabstop = 8
      vim.opt.shiftwidth = 0
      vim.opt.expandtab = false
    end
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "sh",
    callback = function()
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
    end
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "xml",
    callback = function()
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
    end
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "yaml",
    callback = function()
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
    end
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "py",
    callback = function()
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
      vim.opt.shiftwidth = 4
      vim.opt.expandtab = true
    end
  }
)

-- defaults
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 0
vim.opt.tabstop = 4
