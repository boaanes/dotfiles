return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        style = "moon",
        sidebars = {
          "nvim-tree",
          "terminal",
        },
        lualine_bold = true,
      }
    end,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
