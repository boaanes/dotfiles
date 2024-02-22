local o = vim.o

-- global options
-- o.syntax = "on"
o.swapfile = true
o.dir = "/tmp"
o.encoding = "UTF-8"
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.number = true
o.relativenumber = true
o.wildmode = "longest,list,full"
o.splitbelow = true
o.splitright = true
o.autoindent = true
o.scrolloff = 10
o.clipboard = "unnamedplus"
o.updatetime = 100
o.termguicolors = true
o.signcolumn = "yes"
o.completeopt = "menu,menuone,noselect"
o.nowrap = true
o.linebreak = true
-- set gui font
o.guifont = "IntelOne Mono Regular"

vim.cmd("set noshowmode")
