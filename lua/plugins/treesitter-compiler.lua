return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      require("nvim-treesitter.install").compilers = { "clang", "clang++" }
      return opts
    end,
  },
}
