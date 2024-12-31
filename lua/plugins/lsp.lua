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
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "eslint_d",
        "prettierd",
        "ruff",
        "nixpkgs-fmt",
        "markuplint",
        "tflint",
        "shellcheck",
        "editorconfig-checker",
      },
    },
  },
}
