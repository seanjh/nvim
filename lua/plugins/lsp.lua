return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        denols = {
          root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
          single_file_support = false,
        },
        tailwindcss = {
          root_dir = require("lspconfig").util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
        },
        rubocop = { enabled = false },
        ruby_lsp = {
          mason = false,
          setup = function()
            local cmd = vim.fn.executable("ruby-lsp") == 1 and { "ruby-lsp" } or { "bundle", "exec", "ruby-lsp" }
            require("lspconfig").ruby_lsp.setup({ cmd = cmd, mason = false })
            return true -- prevent default setup
          end,
        },
      },
    },
  },
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },
}
