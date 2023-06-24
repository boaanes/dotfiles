return {
  {
    "sainnhe/sonokai",
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require("onedark").setup({
  --       style = "darker",
  --     })
  --     require("onedark").load()
  --   end,
  -- },
  {
    "sekke276/dark_flat.nvim",
    init = function()
      vim.cmd.colorscheme("dark_flat")
    end,
  },
}
