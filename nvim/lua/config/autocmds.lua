-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Custom filetype handler
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit" },
    callback = function()
        local opts = vim.b

        opts.textwidth = 72
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    callback = function()
        local opts = vim.b

        opts.expandtab = false
        opts.shiftwidth = 4
        opts.tabstop = 4
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function()
        local opts = vim.b

        opts.expandtab = true
        opts.shiftwidth = 4
        opts.tabstop = 4
    end
})
