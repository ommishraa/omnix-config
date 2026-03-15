-- lua/plugins/lsp.lua
-- omnix-config — LSP configuration

return {
  -- ── LSP servers ──────────────────────────────────────────
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Nix — most important for your config
        nixd = {
          settings = {
            nixd = {
              nixpkgs = {
                expr = "import <nixpkgs> {}",
              },
              formatting = {
                command = { "alejandra" },
              },
              options = {
                nixos = {
                  expr = '(builtins.getFlake "~/om-works/omnix-config").nixosConfigurations.nixos.options',
                },
              },
            },
          },
        },

        -- Lua — for nvim config
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              codeLens  = { enable = true },
              completion = { callSnippet = "Replace" },
              doc = { privateName = { "^_" } },
              hint = {
                enable     = true,
                setType    = false,
                paramType  = true,
                paramName  = "Disable",
                semicolon  = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },

        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode  = "basic",
                autoSearchPaths   = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },

        -- TypeScript/JS
        ts_ls = {},

        -- CSS
        cssls = {},

        -- HTML
        html = {},

        -- JSON
        jsonls = {},

        -- Bash/Shell
        bashls = {},
      },

      -- Format on save
      format = {
        timeout_ms = 3000,
      },
    },
  },

  -- ── Mason — LSP installer ────────────────────────────────
  -- Note: nixd and lua-language-server are installed via NixOS packages.nix
  -- Mason handles the rest
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",       -- lua formatter
        "shfmt",        -- shell formatter
        "shellcheck",   -- shell linter
        "pyright",      -- python LSP
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "bash-language-server",
      },
    },
  },

  -- ── Formatting ───────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        nix        = { "alejandra" },
        lua        = { "stylua" },
        python     = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        css        = { "prettier" },
        html       = { "prettier" },
        json       = { "prettier" },
        sh         = { "shfmt" },
        bash       = { "shfmt" },
        zsh        = { "shfmt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}