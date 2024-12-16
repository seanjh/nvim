-- vim.g.zenbones_darkness = "warm"

return {
  -- {
  --   "sonph/onehalf",
  --   lazy = false,
  --   config = function(plugin)
  --     vim.opt.rtp:append(plugin.dir .. "/vim")
  --     vim.cmd([[ colorscheme onehalfdark ]])
  --     -- or vim.cmd [[ colorscheme onehalflight ]] if you prefer light theme
  --   end,
  -- },
  -- {
  --   "maxmx03/solarized.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   ---@type solarized.config
  --   opts = {
  --     variant = "winter",
  --   },
  --   config = function(_, opts)
  --     vim.o.termguicolors = true
  --     vim.o.background = "dark"
  --     require("solarized").setup(opts)
  --     vim.cmd.colorscheme("solarized")
  --   end,
  -- },
  -- {
  --   "zenbones-theme/zenbones.nvim",
  --   -- Optionally install Lush. Allows for more configuration or extending the colorscheme
  --   -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  --   -- In Vim, compat mode is turned on as Lush only works in Neovim.
  --   dependencies = "rktjmp/lush.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   -- you can set set configuration options here
  --   -- config = function()
  --   --     vim.g.zenbones_darken_comments = 45
  --   --     vim.cmd.colorscheme('zenbones')
  --   -- end
  -- },
  -- {
  --   "Yazeed1s/minimal.nvim",
  -- },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      transparent = false,
      on_highlights = function(hl, c)
        hl.WinSeparator = { fg = c.blue, bg = "NONE", bold = true }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    -- opts = { colorscheme = "onehalfdark" },
    -- opts = { colorscheme = "solarized" },
    -- opts = { background = "dark", colorscheme = "zenbones" },
    -- opts = { colorscheme = "minimal-base16" },
    opts = { colorscheme = "tokyonight" },
  },
}
