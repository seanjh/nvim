-- lua/plugins/dap-js.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "jay-babu/mason-nvim-dap.nvim" },

    opts = function()
      local dap = require("dap")

      if not dap.adapters["pwa-node"] then
        local js_debug_path =
          require("lazyvim.util").get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js")
        if vim.fn.filereadable(js_debug_path) == 0 then
          vim.notify("js-debug-adapter not found", vim.log.levels.WARN)
          return
        end

        dap.adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              js_debug_path,
              "${port}",
            },
          },
        }
      end

      -- Shared defaults
      local common = {
        cwd = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**", "**/node_modules/**" },
        resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
        autoAttachChildProcesses = true,
      }

      local function with_common(tbl)
        for k, v in pairs(common) do
          if tbl[k] == nil then
            tbl[k] = v
          end
        end
        return tbl
      end

      -- Configurations for TS/JS
      local configs = {
        with_common({
          type = "pwa-node",
          request = "launch",
          name = "Launch file (tsx)",
          program = "${file}",
          runtimeExecutable = "node",
          runtimeArgs = { "--loader=tsx" },
          console = "integratedTerminal",
        }),
        with_common({
          type = "pwa-node",
          request = "attach",
          name = "Attach 9229",
          port = 9229,
          restart = true,
        }),
        with_common({
          type = "pwa-node",
          request = "launch",
          name = "Nodemon (tsx)",
          runtimeExecutable = "nodemon",
          runtimeArgs = {
            "--exec",
            "node --loader=tsx",
            "--signal",
            "SIGTERM",
            "${workspaceFolder}/src/index.ts",
          },
          restart = true,
          console = "integratedTerminal",
        }),
      }

      dap.configurations.typescript = configs
      dap.configurations.javascript = configs
      dap.configurations.typescriptreact = configs
      dap.configurations.javascriptreact = configs
    end,
  },
}
