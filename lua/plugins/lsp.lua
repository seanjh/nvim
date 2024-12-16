return {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
          single_file_support = false,
        },
        tailwindcss = {
          root_dir = require("lspconfig").util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
        },
      },
    },
  }