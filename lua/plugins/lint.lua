vim.api.nvim_create_user_command("LintInfo", function()
  local filetype = vim.bo.filetype
  local linters = require("lint").linters_by_ft[filetype]

  if linters then
    print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
  else
    print("No linters configured for filetype: " .. filetype)
  end
end, {})

local ns = require("lint").get_namespace("my_linter_name")
vim.diagnostic.config({ virtual_text = true }, ns)

return {
  "mfussenegger/nvim-lint",
  opts = {
    ignore_errors = false,
    linters_by_ft = {
      python = { "ruff", "mypy" },
      djangohtml = { "djlint" },
      swift = { "swiftlint" },
      -- Use the "*" filetype to run linters on all filetypes.
      ["*"] = { "typos" },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    },
    linters = {
      -- mypy = {
      --   -- cmd = vim.fn.expand("~/work/mypy-debug.sh"),
      --   -- cwd = "/Users/sean/work/sage",
      -- },
    },
  },
}
