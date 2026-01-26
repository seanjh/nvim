return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "sourcekit" then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end
        end,
      })
    end,
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        denols = {
          root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
          single_file_support = false,
        },
        rubocop = { enabled = false },
        oxlint = {
          root_dir = require("lspconfig").util.root_pattern(".oxlintrc.json"),
        },
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
        sourcekit = {
          cmd = { "xcrun", "sourcekit-lsp" },
          filetypes = { "swift" },
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
