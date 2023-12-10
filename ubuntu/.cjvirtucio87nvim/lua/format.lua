vim.opt.encoding = "utf-8"

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

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "kotlin",
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
    pattern = "lua",
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
    pattern = "terraform",
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
    pattern = "hcl",
    callback = function()
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
    end
  }
)
