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

  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        erb_format = {
          condition = function(_, ctx)
            -- erb_format assumes you're operating on HTML, so it should
            -- be disabled for plaintext ERB templates.
            local skip_patterns = {
              "%.text%.erb$",
            }

            local fname = ctx.filename:lower()
            for _, pattern in ipairs(skip_patterns) do
              if fname:match(pattern) then
                return false
              end
            end
            return true
          end,
        },
      },
    },
  },
}
