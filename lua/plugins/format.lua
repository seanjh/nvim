local enabled = false
-- stylua: ignore
if not enabled then return {} end

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
        },
        formatters = {},
      }
    end,
  },
}
