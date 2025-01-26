if vim.fn.executable("ollama") ~= 1 then
  return {}
end

if true then
  return {}
end

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "llm-ls",
      })
    end,
  },
  {
    "huggingface/llm.nvim",
    opts = {
      accept_keymap = "<M-CR>", -- Alt+Enter
      dismiss_keymap = "<M-BS>", -- Alt+Backspace
      model = "codellama:7b",
      backend = "ollama",
      url = "http://localhost:11434",
      request_body = {
        options = {
          temperature = 0.2,
          top_p = 0.95,
        },
      },
      enable_suggestions_on_startup = true,
      enable_suggestions_on_files = "*",
    },
  },
}
