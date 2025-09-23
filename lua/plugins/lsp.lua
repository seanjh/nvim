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
        -- tailwindcss = {
        --   root_dir = require("lspconfig").util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
        -- },
        rubocop = { enabled = false },
        oxlint = {
          root_dir = require("lspconfig").util.root_pattern(".oxlintrc.json"),
        },
        -- pylsp = {
        --   settings = {
        --     pylsp = {
        --       plugins = {
        --         pycodestyle = { enabled = false },
        --         pyflakes = { enabled = false },
        --         yapf = { enabled = false },
        --         pylint = { enabled = false },
        --         mccabe = { enabled = false },
        --         rope_autoimport = { enabled = false },
        --         ruff = { enabled = false },
        --         -- mypy = { enabled = true, live_mode = true, dmypy = true },
        --         -- https://github.com/python-lsp/pylsp-mypy?tab=readme-ov-file#configuration
        --         pylsp_mypy = {
        --           enabled = true,
        --           live_mode = true,
        --           dmypy = false,
        --           report_progress = true,
        --           -- overrides = {"--python-executable", "/path/to/venv/bin/python", true},
        --         },
        --       },
        --     },
        --   },
        -- },
        ruby_lsp = {
          mason = false,
          setup = function()
            local cmd = vim.fn.executable("ruby-lsp") == 1 and { "ruby-lsp" } or { "bundle", "exec", "ruby-lsp" }
            require("lspconfig").ruby_lsp.setup({ cmd = cmd, mason = false })
            return true -- prevent default setup
          end,
        },
        jinja_lsp = {
          filetypes = { "jinja", "html" },
        },
        vtsls = {
          preferences = {
            -- importModuleSpecifier = "relative",
            importModuleSpecifier = "non-relative",
            importModuleSpecifierEnding = "minimal",
          },
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
