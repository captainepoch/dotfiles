-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
---- Custom filetype handler
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function()
    local opts = vim.b

    opts.textwidth = 72
  end,
})

--- Tabs for Go
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    local opts = vim.b

    opts.expandtab = false
    opts.shiftwidth = 4
    opts.tabstop = 4
  end,
})

--- Tabs for Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    local opts = vim.b

    opts.expandtab = true
    opts.shiftwidth = 4
    opts.tabstop = 4
  end,
})
