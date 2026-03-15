-- lua/plugins/editor.lua
-- omnix-config — editor enhancement plugins

return {
  -- ── Treesitter — syntax highlighting ────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "nix",
        "lua",
        "python",
        "typescript",
        "javascript",
        "tsx",
        "bash",
        "json",
        "jsonc",
        "toml",
        "yaml",
        "markdown",
        "markdown_inline",
        "css",
        "html",
        "regex",
        "vim",
        "vimdoc",
      })
    end,
  },

  -- ── Telescope — fuzzy finder ─────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy  = "horizontal",
        layout_config    = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend         = 0,
        prompt_prefix    = "  ",
        selection_caret  = " ",
      },
    },
    keys = {
      { "<leader>fn", "<cmd>Telescope find_files cwd=~/om-works/omnix-config<cr>", desc = "Find in omnix-config" },
    },
  },

  -- ── Auto pairs ───────────────────────────────────────────
  {
    "echasnovski/mini.pairs",
    opts = {},
  },

  -- ── Surround ─────────────────────────────────────────────
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add            = "gsa",
        delete         = "gsd",
        find           = "gsf",
        find_left      = "gsF",
        highlight      = "gsh",
        replace        = "gsr",
        update_n_lines = "gsn",
      },
    },
  },

  -- ── Git signs in gutter ──────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
        map("n", "]h", gs.next_hunk,        "Next hunk")
        map("n", "[h", gs.prev_hunk,        "Prev hunk")
        map("n", "<leader>ghs", gs.stage_hunk,   "Stage hunk")
        map("n", "<leader>ghr", gs.reset_hunk,   "Reset hunk")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>ghb", gs.blame_line,   "Blame line")
      end,
    },
  },

  -- ── Todo comments ────────────────────────────────────────
  {
    "folke/todo-comments.nvim",
    opts = {
      signs = true,
      keywords = {
        FIX  = { icon = " ", color = "error",   alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        NOTE = { icon = " ", color = "hint",    alt = { "INFO" } },
      },
    },
  },

  -- ── Which-key — keybind popup ────────────────────────────
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>g",  group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>c",  group = "code" },
        { "<leader>f",  group = "find" },
        { "<leader>b",  group = "buffer" },
        { "<leader>w",  group = "windows" },
        { "<leader>u",  group = "ui" },
        { "<leader>x",  group = "diagnostics" },
      },
    },
  },

  -- ── Lazygit integration ──────────────────────────────────
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}