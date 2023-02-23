return {
  "wbthomason/packer.nvim",
  "moll/vim-bbye",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-vsnip",
  "jose-elias-alvarez/null-ls.nvim",
  "hrsh7th/vim-vsnip",
  "romainl/vim-cool",
  "jose-elias-alvarez/typescript.nvim",
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "hrsh7th/nvim-cmp",
  "rcarriga/nvim-notify",
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      return {
        color_icons = true,
        default = true,
      }
    end,
  },
  { "levouh/tint.nvim", config = true },
  { "stevearc/dressing.nvim", config = true },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", config = true },
  { "windwp/nvim-ts-autotag", config = true },
  { "windwp/nvim-autopairs", config = true },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return {
        view = {
          adaptive_size = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.g.gitgutter_sign_priority = 0
    end,
  },
  {
    "github/copilot.vim",
    config = function()
      vim.cmd([[
                imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
                let g:copilot_no_tab_map = v:true
            ]])
    end,
  },
  {
    "sainnhe/sonokai",
    config = function()
      vim.cmd([[colorscheme sonokai]])
      vim.opt.termguicolors = true
    end,
  },
  {
    "APZelos/blamer.nvim",
    config = function()
      vim.g.blamer_delay = 200
      vim.g.blamer_show_in_insert_modes = false
      vim.g.blamer_show_in_visual_modes = false
      vim.g.blamer_date_format = "%d.%m.%y %H:%M"
      vim.g.blamer_relative_time = true
      vim.g.blamer_enabled = true
    end,
  },
  {
    "akinsho/nvim-bufferline.lua",
    version = "v3.*",
    opts = function()
      return {
        options = {
          separator_style = "slant",
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        messages = {
          view = "mini",
          view_error = "mini",
          view_warn = "mini",
        },
        popupmenu = {
          backend = "nui",
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
  },
}
