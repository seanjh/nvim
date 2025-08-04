local function is_temporalio_project()
  return vim.fn.getcwd():match("temporalio%-sdk%-ruby") ~= nil
end

if not is_temporalio_project() then
  return {}
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ruby = {}, -- disable ruby formatting
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          cmd = { "ruby-lsp" },
        },
      },
    },
  },
}
