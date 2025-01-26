return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        nix = { "nixpkgs-fmt" },
        lua = { "stylua" },
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
        ["nixpkgs-fmt"] = {
          command = "nixpkgs-fmt",
          stdin = true,
        },
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
        stylua = {
          command = "stylua",
          args = { "--search-parent-directories", "--stdin-filepath", "$FILENAME", "-" },
        },
      },
    },
  },
}
