local running_linters = function()
  local spinner_chars = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local running = require("lint").get_running()
  if #running > 0 then
    local index = math.floor(vim.loop.now() / 150) % #spinner_chars + 1
    return "linters " .. spinner_chars[index] .. " " .. table.concat(running, ",")
  else
    return "linters ▪"
  end
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, {
      function()
        return running_linters()
      end,
    })
  end,
}
