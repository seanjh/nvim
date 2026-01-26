return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.pickers = opts.pickers or {}
    opts.pickers.live_grep = vim.tbl_deep_extend("force", opts.pickers.live_grep or {}, {
      max_results = 500, -- cap results to avoid preview-driven lag
    })
  end,
}
