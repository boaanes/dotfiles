vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('settings')
require('maps')
require('plugins')
require('impatient')
require('treesitter')
require('lualine').setup {}
require('bufferline').setup {
    options = {
        separator_style = 'slant'
    }
}
require('nvim_tree')
require("nvim-autopairs").setup {}
require('nvim-ts-autotag').setup()

require('mason').setup()
require('mason-lspconfig').setup()
require('lsp_config_wrapper')

require('telescope').load_extension('fzf')

require('dressing').setup({})
require('tint').setup()

require'nvim-web-devicons'.setup {
 color_icons = true;
 default = true;
}

