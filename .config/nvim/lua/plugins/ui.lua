return {
  "romainl/vim-cool",
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 0.8,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
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
  --{
  --  "levouh/tint.nvim",
  --  opts = function()
  --    return {
  --      window_ignore_function = function(winid)
  --        local bufnr = vim.api.nvim_win_get_buf(winid)
  --        local bufname = vim.api.nvim_buf_get_name(bufnr)
  --        if bufname:find("filesystem") then
  --          return true
  --        end
  --        return false
  --      end,
  --    }
  --  end,
  --},
  { "stevearc/dressing.nvim", config = true },
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local CodeGPTModule = require("codegpt")
      local CopilotModule = require("copilot_status")
      return {
        options = {
          theme = "onedark",
          globalstatus = true,
        },
        sections = {
          lualine_x = {
            CodeGPTModule.get_status,
            CopilotModule.status_string,
            "encoding",
            "fileformat",
            "filetype",
          },
        },
      }
    end,
  },
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.g.gitgutter_sign_priority = 0
    end,
  },
  {
    "APZelos/blamer.nvim",
    init = function()
      vim.g.blamer_enabled = 1
      vim.g.blamer_show_in_insert_modes = 0
      vim.g.blamer_show_in_visual_modes = 0
      vim.g.blamer_date_format = "%d.%m.%y %H:%M"
      vim.g.blamer_relative_time = 1
      vim.g.blamer_delay = 0
    end,
  },
  {
    "akinsho/nvim-bufferline.lua",
    version = "v3.*",
    opts = {
      options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
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
  {
    "neovimhaskell/haskell-vim",
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>d", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>D", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
}
