-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.fileformats = { "unix" }
vim.opt.fileencodings = { "utf-8", "ucs-bom", "latin1" }

vim.opt.breakindent = true
vim.opt.clipboard = { "unnamedplus" }
vim.opt.expandtab = false
vim.opt.linebreak = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 4
vim.opt.sidescroll = 3
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.wrap = true

vim.opt.lbr = true

vim.opt.textwidth = 80
vim.opt.wrapmargin = 2
vim.opt.cc = { 80 }
