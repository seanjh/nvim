vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { { "prettierd" } },
        javascriptreact = { { "prettierd" } },
        typescript = { { "prettierd" } },
        typescriptreact = { { "prettierd" } },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        ["markdown.mdx"] = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        html = { "prettierd" },
      },
      -- Configure formatters
      formatters = {
        prettierd = {
          -- This tells conform to only run prettier when it finds a config file
          condition = function(ctx)
            return vim.fs.find({
              ".prettierrc",
              ".prettierrc.js",
              ".prettierrc.json",
              ".prettierrc.yml",
              ".prettierrc.yaml",
              ".prettierrc.json5",
              ".prettierrc.cjs",
              "prettier.config.js",
              "prettier.config.cjs",
              "prettier.config.mjs",
              "package.json",
            }, { path = ctx.filename, upward = true })[1] ~= nil
          end,
        },
        eslint_d = {
          -- Only run eslint if we find a config file in the project
          condition = function(ctx)
            return vim.fs.find({
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
              "eslint.config.js",
              "package.json",
            }, { path = ctx.filename, upward = true })[1] ~= nil
          end,
        },
      },
    },
  },
}
