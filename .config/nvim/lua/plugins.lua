return {
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-vsnip',
    'jose-elias-alvarez/null-ls.nvim',
    'hrsh7th/vim-vsnip',
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',
    'romainl/vim-cool',
    'jose-elias-alvarez/typescript.nvim',
    'levouh/tint.nvim',
    'stevearc/dressing.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-tree/nvim-tree.lua',
    'nvim-lualine/lualine.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'hrsh7th/nvim-cmp',
    {
        'lervag/vimtex',
        config = function()
            vim.g.vimtex_view_method = 'zathura'
        end,
    },
    {
        'airblade/vim-gitgutter',
        config = function()
            vim.g.gitgutter_sign_priority = 0
        end,
    },
    {
        'github/copilot.vim',
        config = function()
            vim.cmd([[
                imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
                let g:copilot_no_tab_map = v:true
            ]])
        end,
    },
    {
        'sainnhe/sonokai',
        config = function()
            vim.cmd([[colorscheme sonokai]])
            vim.opt.termguicolors = true
        end,
    },
    {
        'APZelos/blamer.nvim',
        config = function()
            vim.g.blamer_enabled = true
            vim.g.blamer_delay = 200
            vim.g.blamer_show_in_insert_modes = false
            vim.g.blamer_show_in_visual_modes = false
            vim.g.blamer_date_format = '%d.%m.%y %H:%M'
            vim.g.blamer_relative_time = true
        end,
    },
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
