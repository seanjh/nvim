local enabled = true
-- stylua: ignore
if not enabled then return {} end

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = "*", -- set this if you want to always pull the latest change
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },

  opts = function()
    local config = {
      provider = "claude",
      auto_suggestions_provider = "claude",
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        enable_cursor_planning_mode = true,
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-7-sonnet-latest",
        temperature = 0,
        max_tokens = 4096,
      },
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",
        temperature = 0,
        max_tokens = 4096,
      },
      vendors = {
        groq = { -- define groq provider
          __inherited_from = "openai",
          endpoint = "https://api.groq.com/openai/v1/",
          -- model = "llama-3.3-70b-versatile",
          model = "qwen-2.5-coder-32b",
          max_tokens = 32768,
        },
        ollama = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "qwen2.5-coder:7b",
          -- model = "codellama:7b",
          -- model = "deepseek-r1:7b",
        },
      },
      file_selector = {
        provider = "fzf",
        provider_opts = {},
      },
      compat = {
        "avante_commands",
        "avante_mentions",
        "avante_files",
      },
      suggestion = {
        debounce = 600,
        throttle = 600,
      },
      windows = {
        position = "right",
        width = 30,
      },
    }

    -- if vim.fn.executable("ollama") == 1 then
    --   config.provider = "ollama"
    --   config.auto_suggestions_provider = "ollama"
    --   config.behaviour.auto_suggestions = true
    -- end

    return config
  end,
}
