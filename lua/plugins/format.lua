return {
  {
    "stevearc/conform.nvim",
    opts = function()
      return {
        formatters_by_ft = {
          nix = { "nixfmt" },
          lua = { "stylua" },
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          json = { "jq" },
          jsonc = { "jq" },
          yaml = { "yamlfix" },
          markdown = { "markdownlint" },
          ["markdown.mdx"] = { "markdownlint" },
          python = { "black", "isort" },
          ruby = { "standardrb" },
        },
        formatters = {},
      }
    end,
  },
}
