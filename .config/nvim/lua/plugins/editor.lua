return {
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/nvim-cmp",
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
    "github/copilot.vim",
    config = function()
      vim.cmd([[
                imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
                let g:copilot_no_tab_map = v:true
            ]])
    end,
  },
}
