return {
  { "zidhuss/neotest-minitest" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "zidhuss/neotest-minitest",
      "marilari88/neotest-vitest",
    },
    config = {
      adapters = {
        ["neotest-minitest"] = {
          test_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rails",
              "test",
            })
          end,
        },
        ["neotest-vitest"] = {},
      },
    },
  },
}
