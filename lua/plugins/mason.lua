return {
  {
    -- f.k.a. "williamboman/mason-lspconfig.nvim",
    "mason-org/mason-lspconfig.nvim",
    opts = {
      PATH = "append",
      ensure_installed = {
        "marksman",
      },
    },
  },
  {
    -- f.k.a. "williamboman/mason.nvim",
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "markdownlint-cli2",
      },
    },
  },
}
