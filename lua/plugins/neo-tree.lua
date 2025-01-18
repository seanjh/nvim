return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            always_show = {
              ".aws",
            },
            always_show_by_pattern = {
              ".env*",
            },
          },
        },
      })
    end,
  },
}
