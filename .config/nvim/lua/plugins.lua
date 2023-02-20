return {
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'airblade/vim-gitgutter',
    'sainnhe/sonokai',
    'moll/vim-bbye',
    'APZelos/blamer.nvim',
    'nvim-tree/nvim-web-devicons',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-vsnip',
    'jose-elias-alvarez/null-ls.nvim',
    'hrsh7th/vim-vsnip',
    'github/copilot.vim',
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',
    'romainl/vim-cool',
    'jose-elias-alvarez/typescript.nvim',
    'levouh/tint.nvim',
    'stevearc/dressing.nvim',
    'lervag/vimtex',
    'nvim-tree/nvim-web-devicons',
    'nvim-tree/nvim-tree.lua',
    'nvim-lualine/lualine.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'hrsh7th/nvim-cmp',
    {
        'akinsho/nvim-bufferline.lua',
        version = 'v3.*',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim', version = '0.1.1',
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    ({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                messages = {
                    view = "mini",
                    view_error = "mini",
                    view_warn = "mini",
                },
                popupmenu = {
                    backend = 'nui',
                },
                lsp = {
                    signature = {
                        enabled = true,
                    },
                    hover = {
                        enabled = true,
                    },
                },
            })
        end,
    })
}
