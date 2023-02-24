return {
  "moll/vim-bbye",
  "romainl/vim-cool",
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
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
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.g.gitgutter_sign_priority = 0
    end,
  },
  { -- TODO: fix config not working
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
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
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
