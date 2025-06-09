return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      -- "graphql",
      ensure_installed = {
        -- "denols",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "emmet_ls",
        "ruff",
        "gopls",
        "clangd",
        "terraformls",
        "tflint",
        "pyright",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        { "stylua", version = "v0.19.1" }, -- lua formatter
        "eslint_d", -- js linter
        "prettier", -- prettier formatter
        "deno", -- linter
        "ruff", -- python linter and formatter
        "gofumpt", -- go formatter
        "goimports", -- go formatter
        "golangci-lint", -- go linter
        "clang-format", -- C/C++ formatter
        "cpplint", -- C/C++ linter
      },
      auto_update = false,
    })
  end,
}
