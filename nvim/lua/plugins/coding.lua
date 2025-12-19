return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in the same line
      -- ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
      check_ts = true, -- use treesitter to check for a pair.
      ts_config = {
        lua = { "string" }, -- it will not add pair on that treesitter node
        java = false, -- don't check treesitter on java
      },
    },
  },
  {
    "fredrikaverpil/godoc.nvim",
    cmd = { "GoDoc" },
    opts = {},
  },
}
