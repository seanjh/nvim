if vim.g.vscode then
  return {}
end

return {
  { "LazyVim/LazyVim", colorscheme = "tokyonight" },
  {
    "folke/tokyonight.nvim",
    opts = { style = "storm" },
  },
}
