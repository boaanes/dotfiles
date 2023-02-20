vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- leader key
vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require('settings')
require('maps')

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

