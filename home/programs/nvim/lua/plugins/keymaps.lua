-- lua/config/keymaps.lua
-- omnix-config — custom keymaps

local map = vim.keymap.set

-- ── Better navigation ─────────────────────────────────────
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- ── Resize windows ────────────────────────────────────────
map("n", "<C-Up>",    "<cmd>resize +2<cr>",          { desc = "Increase window height" })
map("n", "<C-Down>",  "<cmd>resize -2<cr>",          { desc = "Decrease window height" })
map("n", "<C-Left>",  "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- ── Move lines ────────────────────────────────────────────
map("n", "<A-j>", "<cmd>m .+1<cr>==",        { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==",        { desc = "Move line up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv",        { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv",        { desc = "Move selection up" })

-- ── Better indenting ──────────────────────────────────────
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- ── Buffers ───────────────────────────────────────────────
map("n", "<S-h>",      "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>",      "<cmd>bnext<cr>",     { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>",   { desc = "Delete buffer" })

-- ── Clear search ──────────────────────────────────────────
map("n", "<Esc>", "<cmd>nohl<cr>", { desc = "Clear search highlights" })

-- ── Save ──────────────────────────────────────────────────
map({ "i", "n" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- ── Quit ──────────────────────────────────────────────────
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- ── Open file manager ─────────────────────────────────────
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
map("n", "<leader>E", "<cmd>Neotree reveal<cr>",  { desc = "Reveal in file tree" })

-- ── Terminal ──────────────────────────────────────────────
map("n", "<leader>tt", "<cmd>terminal<cr>", { desc = "Open terminal" })

-- ── Omnix shortcuts ───────────────────────────────────────
map("n", "<leader>fn", "<cmd>Telescope find_files cwd=~/om-works/omnix-config<cr>",
  { desc = "Find in omnix-config" })
map("n", "<leader>fc", "<cmd>Telescope find_files cwd=~/.config<cr>",
  { desc = "Find in .config" })