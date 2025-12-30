-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local o = vim.opt

-- encoding
o.encoding = "utf-8"
o.fileformat = "unix"
o.fileformats = { "unix" }
o.fileencodings = { "utf-8", "ucs-bom", "latin1" }

o.breakindent = true
o.cc = { 80 }
-- keep in sync with the system clipboard
o.clipboard = "unnamedplus"
-- improve diff visualization
o.diffopt = "internal,filler,closeoff,linematch:60"
o.eol = true
-- use spaces instead of tabs
o.expandtab = true
-- ensure new line at the end
o.fixeol = true
o.lbr = true
o.linebreak = true
-- define invisible chars
o.listchars = {
  eol = "↲",
  tab = "→ ",
  trail = "+",
  extends = ">",
  precedes = "<",
  space = "·",
  nbsp = "␣",
}
-- enable mouse ( see :h mouse )
o.mouse = "nv"
o.number = true
o.relativenumber = false
-- minimal number of screen lines to keep above and below the cursor
o.scrolloff = 10
-- the number of spaces inserted for each indentation
o.shiftwidth = 4
o.sidescroll = 3
-- always show the signcolumn, otherwise it would shift the text each time
o.signcolumn = "yes"
-- force all horizontal splits to go below current window
o.splitbelow = true
-- force all vertical splits to go to the right of current window
o.splitright = true
-- number of spaces tabs count for
o.tabstop = 2
-- how many columns a tab counts foro.wrap = true
o.tabstop = 2
o.textwidth = 80
o.wrapmargin = 2
