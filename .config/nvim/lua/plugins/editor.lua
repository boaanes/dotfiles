return {
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/nvim-cmp",
  {
    "dpayne/CodeGPT.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
  { "windwp/nvim-ts-autotag", config = true },
  { "windwp/nvim-autopairs", config = true },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        keymap = {
          jump_prev = "øø",
          jump_next = "ææ",
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-A>",
          next = "<C-æ>",
          prev = "<C-ø>",
        },
      },
    },
  },
  {
    "jonahgoldwastaken/copilot-status.nvim",
    dependencies = { "zbirenbaum/copilot.lua" }, -- or "zbirenbaum/copilot.lua"
    lazy = true,
    event = "BufReadPost",
    opts = {
      icons = {
        idle = "",
        loading = "",
        offline = "",
        error = "",
        warning = "",
      },
    },
  },
}
