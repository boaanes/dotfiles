vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use 'airblade/vim-gitgutter'
    use 'sainnhe/sonokai'
    use 'moll/vim-bbye'
    use 'APZelos/blamer.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons' }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/cmp-vsnip'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'hrsh7th/vim-vsnip'
    use 'github/copilot.vim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'romainl/vim-cool'
    use 'jose-elias-alvarez/typescript.nvim'
    use 'levouh/tint.nvim'
    use 'stevearc/dressing.nvim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
            })
        end
    }
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use({
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
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        "hrsh7th/nvim-cmp",
        }
    })
end)
