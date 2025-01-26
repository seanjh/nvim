return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          always_show = { ".aws", ".circleci", ".github" },
          always_show_by_pattern = {
            ".env*",
          },
        },
      },
    },
  },
}
