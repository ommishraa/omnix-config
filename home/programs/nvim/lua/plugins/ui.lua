-- lua/plugins/ui.lua
-- omnix-config — UI plugins

return {
  -- ── Colorscheme — Tokyo Night ────────────────────────────
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments    = { italic = true },
        keywords    = { italic = true },
        functions   = {},
        variables   = {},
        sidebars    = "dark",
        floats      = "dark",
      },
      on_highlights = function(hl, c)
        -- Match our teal/cyan kitty theme
        hl.CursorLine   = { bg = c.bg_highlight }
        hl.LineNr       = { fg = c.dark5 }
        hl.CursorLineNr = { fg = c.orange, bold = true }
      end,
    },
  },

  -- Set Tokyo Night as default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  -- ── Dashboard ────────────────────────────────────────────
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
      theme = "doom",
      config = {
        header = {
          "",
          "  ██████╗ ███╗   ███╗███╗   ██╗██╗██╗  ██╗",
          " ██╔═══██╗████╗ ████║████╗  ██║██║╚██╗██╔╝",
          " ██║   ██║██╔████╔██║██╔██╗ ██║██║ ╚███╔╝ ",
          " ██║   ██║██║╚██╔╝██║██║╚██╗██║██║ ██╔██╗ ",
          " ╚██████╔╝██║ ╚═╝ ██║██║ ╚████║██║██╔╝ ██╗",
          "  ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝",
          "",
          "         NixOS · Hyprland · LazyVim         ",
          "",
        },
        center = {
          {
            icon = "  ",
            icon_hl = "Title",
            desc = "Find File",
            desc_hl = "String",
            key = "f",
            key_hl = "Number",
            action = "Telescope find_files",
          },
          {
            icon = "  ",
            icon_hl = "Title",
            desc = "Recent Files",
            desc_hl = "String",
            key = "r",
            key_hl = "Number",
            action = "Telescope oldfiles",
          },
          {
            icon = "  ",
            icon_hl = "Title",
            desc = "Find Text",
            desc_hl = "String",
            key = "g",
            key_hl = "Number",
            action = "Telescope live_grep",
          },
          {
            icon = "  ",
            icon_hl = "Title",
            desc = "Config",
            desc_hl = "String",
            key = "c",
            key_hl = "Number",
            action = "e ~/.config/nvim/lua/plugins",
          },
          {
            icon = "󰒓  ",
            icon_hl = "Title",
            desc = "omnix-config",
            desc_hl = "String",
            key = "o",
            key_hl = "Number",
            action = "e ~/om-works/omnix-config",
          },
          {
            icon = "  ",
            icon_hl = "Title",
            desc = "Lazy",
            desc_hl = "String",
            key = "l",
            key_hl = "Number",
            action = "Lazy",
          },
          {
            icon = "  ",
            icon_hl = "Title",
            desc = "Quit",
            desc_hl = "String",
            key = "q",
            key_hl = "Number",
            action = "qa",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          return {
            "",
            "⚡ " .. stats.count .. " plugins loaded in " .. stats.startuptime .. "ms",
          }
        end,
      },
    },
  },

  -- ── Lualine — status bar ─────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "tokyonight",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- ── Noice — better UI for messages/cmdline ───────────────
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search        = true,
        command_palette      = true,
        long_message_to_split = true,
        inc_rename           = false,
        lsp_doc_border       = true,
      },
    },
  },

  -- ── Indent guides ────────────────────────────────────────
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = { char = "│" },
      scope  = { enabled = false },
    },
  },
}