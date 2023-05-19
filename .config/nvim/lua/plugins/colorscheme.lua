return {
  {
    "sainnhe/sonokai",
  },
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- opts = function()
    --   return {
    --     style = "storm",
    --     lualine_bold = true,
    --     styles = {
    --       comments = { italic = true },
    --       keywords = { italic = true },
    --     },
    --   }
    -- end,
    -- config = function(_, opts)
    --   local tokyo = require("tokyonight")
    --   tokyo.setup(opts)
    --   tokyo.load()
    -- end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      require("onedark").load()
    end,
  },
}
