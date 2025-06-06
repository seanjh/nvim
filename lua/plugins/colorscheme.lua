if vim.g.vscode then
  return {}
end

return {
  { "shaunsingh/nord.nvim", name = "nord" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
