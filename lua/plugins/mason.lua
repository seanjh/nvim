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
        -- "pylsp",
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
        "mypy",
        "jinja-lsp",
        "django-template-lsp",
        "djlint",
      },
    },
  },
}
