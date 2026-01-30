-- ~/.config/nvim/lua/plugins/treesitter-compiler.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      require("nvim-treesitter.install").compilers = { "clang", "clang++" }
      -- opts.auto_install = false
      return opts
    end,
  },
}
