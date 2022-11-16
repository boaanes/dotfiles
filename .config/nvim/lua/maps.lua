local map = vim.api.nvim_set_keymap
local builtin = require('telescope.builtin')

-- leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- bindings
    options = { noremap = true }
    map('n', '<leader>w', ':w<CR>', options)
    map('n', '<leader>q', ':q<CR>', options)
    map('n', 'fq', ':q!<CR>', options)
    map('n', '<Tab>', ':bn<CR>', options)
    map('n', '<S-Tab>', ':bp<CR>', options)
    map('n', '<leader>d', ':bd<CR>', options)
    map('n', '<leader>n', ':ene<CR>', options)
    map('n', '<CR>', ':noh<CR>', options)

    -- navigating splits
    map('n', '<C-H>', '<C-W><C-H>', options)
    map('n', '<C-J>', '<C-W><C-J>', options)
    map('n', '<C-K>', '<C-W><C-K>', options)
    map('n', '<C-L>', '<C-W><C-L>', options)

    -- telescope
    vim.keymap.set('n', '<leader>p', builtin.find_files, {})
    vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
