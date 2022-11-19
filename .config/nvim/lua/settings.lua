local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options
-- o.syntax = 'on'
o.swapfile = true
o.dir = '/tmp'
o.encoding = 'UTF-8'
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.number = true
o.relativenumber = true
o.wildmode = 'longest,list,full'
o.splitbelow = true
o.splitright = true
o.autoindent = true
o.scrolloff = 10
o.clipboard = 'unnamedplus'
o.updatetime = 100
o.termguicolors = true
o.signcolumn = 'yes'
o.completeopt = 'menu,menuone,noselect'

vim.cmd "set noshowmode"

-- blamer
vim.g.blamer_enabled = true
vim.g.blamer_delay = 200
vim.g.blamer_show_in_insert_modes = false
vim.g.blamer_date_format = '%d.%m.%y %H:%M'
vim.g.blamer_relative_time = true

-- theming
vim.cmd.colorscheme "sonokai"
vim.opt.termguicolors = true

vim.g.gitgutter_sign_priority = 0
