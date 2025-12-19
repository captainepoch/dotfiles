return {
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  -- priority = 1000,
  -- opts = {
  --   flavour = "mocha",
  --   integrations = {
  --     cmp = true,
  --     gitsigns = true,
  --     nvimtree = true,
  --     treesitter = true,
  --     telescope = true,
  --     mason = true,
  --     which_key = true,
  --     native_lsp = {
  --       enabled = true,
  --     },
  --   },
  -- },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "cool",
      })
      require("onedark").load()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
