local map = vim.api.nvim_set_keymap
local builtin = require("telescope.builtin")

local options = { noremap = true, silent = true }
-- bindings
map("n", "<leader>w", ":w<CR>", options)
map("n", "<leader>q", ":q<CR>", options)
map("n", "fq", ":q!<CR>", options)
map("n", "<Tab>", ":bn<CR>", options)
map("n", "<S-Tab>", ":bp<CR>", options)
map("n", "<leader>d", ":Bdelete<CR>", options)
map("n", "<leader>n", ":ene<CR>", options)
map("n", "H", "0", options)
map("n", "L", "$", options)

-- navigating splits
map("n", "<C-H>", "<C-W><C-H>", options)
map("n", "<C-J>", "<C-W><C-J>", options)
map("n", "<C-K>", "<C-W><C-K>", options)
map("n", "<C-L>", "<C-W><C-L>", options)

-- nvim-tree
map("n", "<leader>t", ":NvimTreeFocus<CR>", options)
map("n", "<leader>ft", ":NvimTreeFindFile<CR>", options)

-- telescope
vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
