vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('settings')
require('maps')
require('plugins')
require('treesitter')
require('lualine').setup {}
require('lsp_config_wrapper')
require('nvim_tree')

require'nvim-web-devicons'.setup {
 color_icons = true;
 default = true;
}

