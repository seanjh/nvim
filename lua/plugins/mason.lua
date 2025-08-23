return {
  {
    -- f.k.a. "williamboman/mason-lspconfig.nvim",
    "mason-org/mason-lspconfig.nvim",
    opts = {
      PATH = "append",
      ensure_installed = {
        "marksman",
        "yamlls",
        "jsonls",
      },
    },
  },
  {
    -- f.k.a. "williamboman/mason.nvim",
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "oxlint",
        "nil",
        "markdownlint",
        "fixjson",
        "prettierd",
        "nixfmt",
        "yamlfix",
        "jinja-lsp",
      },
    },
  },
}
