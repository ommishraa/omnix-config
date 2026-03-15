-- lua/config/options.lua
-- omnix-config — neovim options

local opt = vim.opt

-- ── Editing ───────────────────────────────────────────────
opt.tabstop      = 2        -- 2 spaces per tab
opt.shiftwidth   = 2        -- indent size
opt.expandtab    = true     -- spaces not tabs
opt.smartindent  = true
opt.wrap         = false    -- no line wrap

-- ── UI ────────────────────────────────────────────────────
opt.number         = true   -- line numbers
opt.relativenumber = true   -- relative line numbers
opt.cursorline     = true   -- highlight current line
opt.signcolumn     = "yes"  -- always show sign column
opt.scrolloff      = 8      -- keep 8 lines above/below cursor
opt.sidescrolloff  = 8
opt.termguicolors  = true
opt.showmode       = false  -- don't show -- INSERT -- (lualine shows it)
opt.pumheight      = 10     -- max autocomplete popup items

-- ── Search ────────────────────────────────────────────────
opt.ignorecase = true       -- case insensitive search
opt.smartcase  = true       -- unless uppercase used
opt.hlsearch   = true
opt.incsearch  = true

-- ── Files ─────────────────────────────────────────────────
opt.undofile   = true       -- persistent undo
opt.swapfile   = false
opt.backup     = false
opt.updatetime = 250        -- faster completion
opt.timeoutlen = 300

-- ── Splits ────────────────────────────────────────────────
opt.splitbelow = true       -- new splits go below
opt.splitright = true       -- new splits go right

-- ── Clipboard ─────────────────────────────────────────────
opt.clipboard = "unnamedplus"  -- use system clipboard

-- ── Folding ───────────────────────────────────────────────
opt.foldmethod = "expr"
opt.foldexpr   = "nvim_treesitter#foldexpr()"
opt.foldlevel  = 99         -- open all folds by default