return {
  { "tpope/vim-rails", event = "VeryLazy" },
  { "tpope/vim-rake", event = "VeryLazy" },
  { "tpope/vim-bundler", event = "VeryLazy" },
  { "tpope/vim-dispatch", event = "VeryLazy" },
  -- Disable nvim-treesitter indentation for ruby due to annoying handling
  -- of "." characters and other syntax.
  -- https://github.com/nvim-treesitter/nvim-treesitter/issues/3363
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = true, disable = { "ruby" } },
    },
  },
  -- { "tpope/vim-dadbod" },
  -- { "tpope/vim-sleuth" },
  -- { "tpope/vim-endwise" },
}
