return {
  {
    "stevearc/conform.nvim",
    opts = function()
      return {
        default_format_opts = {
          timeout_ms = 5000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },

        formatters_by_ft = {
          nix = { "nixfmt" },
          lua = { "stylua" },
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          json = { "fixjson" },
          jsonc = { "fixjson" },
          yaml = { "yamlfix" },
          markdown = { "markdownlint" },
          ["markdown.mdx"] = { "markdownlint" },
          python = { "ruff_format" },
          ruby = { "standardrb" },
          eruby = { "erb_lint" },
        },
        formatters = {
          erb_lint = {
            stdin = false,
            tmpfile_format = ".conform.$RANDOM.$FILENAME",
            command = "bundle",
            args = { "exec", "erb_lint", "--autocorrect", "$FILENAME" },
          },
        },
      }
    end,
  },
}
