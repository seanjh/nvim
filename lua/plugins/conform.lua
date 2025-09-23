local has_prettier_config = function()
  local configs = {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.js",
    ".prettierrc.mjs",
    ".prettierrc.cjs",
    "prettier.config.js",
    "prettier.config.mjs",
    "prettier.config.cjs",
  }

  for _, config in ipairs(configs) do
    if vim.fn.findfile(config, ".;") ~= "" then
      return true
    end
  end

  local package_json = vim.fn.findfile("package.json", ".;")
  if package_json ~= "" then
    local ok, content = pcall(vim.fn.readfile, package_json)
    if ok then
      local still_ok, parsed = pcall(vim.json.decode, content)
      if still_ok and parsed.prettier then
        return true
      end
    end
  end

  return false
end

return {
  {
    "stevearc/conform.nvim",
    opts = function()
      return {
        default_format_opts = {
          timeout_ms = 5000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },

        formatters_by_ft = {
          nix = { "nixfmt" },
          lua = { "stylua" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          json = has_prettier_config() and { "prettier" } or { "fixjson" },
          jsonc = has_prettier_config() and { "prettier" } or { "fixjson" },
          yaml = has_prettier_config() and { "prettier" } or { "yamlfix" },
          markdown = { "markdownlint" },
          ["markdown.mdx"] = { "markdownlint" },
          python = { "ruff_fix", "ruff_format" },
          ruby = { "standardrb" },
          eruby = { "erb_lint" },
          htmldjango = { "djlint" },
        },
        formatters = {
          djlint = {
            args = { "-", "--reformat" },
          },
          erb_lint = {
            stdin = false,
            tmpfile_format = ".conform.$RANDOM.$FILENAME",
            command = "bundle",
            args = { "exec", "erb_lint", "--autocorrect", "$FILENAME" },
          },
        },
      }
    end,
  },
}
