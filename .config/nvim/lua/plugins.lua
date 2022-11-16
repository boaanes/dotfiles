vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'airblade/vim-gitgutter'
    use 'sainnhe/sonokai'
    use 'feline-nvim/feline.nvim'
    use 'nvim-tree/nvim-web-devicons'
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
    use {
      'kdheepak/tabline.nvim',
      config = function()
        require'tabline'.setup {
          -- Defaults configuration options
          enable = true,
          options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
            section_separators = {'', ''},
            component_separators = {'', ''},
            max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
            show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
            show_devicons = true, -- this shows devicons in buffer section
            show_bufnr = false, -- this appends [bufnr] to buffer section,
            show_filename_only = false, -- shows base filename only instead of relative path in filename
            modified_icon = "+ ", -- change the default modified icon
            modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
            show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
          }
        }
        vim.cmd[[
          set guioptions-=e " Use showtabline in gui vim
          set sessionoptions+=tabpages,globals " store tabpages and globals in session
        ]]
      end,
      requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
    }
end)
