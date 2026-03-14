return function()
	local set = vim.api.nvim_set_hl

	-- Base UI
	set(0, "Normal", { fg = "#e1e4da", bg = "#11140f" })
	set(0, "NormalFloat", { fg = "#e1e4da", bg = "#1d211a" })
	set(0, "CursorLine", { bg = "#272b25" })
	set(0, "CursorLineNr", { fg = "#a8d292", bold = true })
	set(0, "LineNr", { fg = "#8d9387" })
	set(0, "NeoTreeNormal", { bg = "#11140f" })
	set(0, "NeoTreeNormalNC", { bg = "#11140f" })
	set(0, "NeoTreeFloatBorder", { fg = "#8d9387" })
	-- Syntax
	set(0, "Comment", { fg = "#8d9387", italic = true })
	set(0, "Keyword", { fg = "#a8d292", bold = true })
	set(0, "Function", { fg = "#bccbb0" })
	set(0, "String", { fg = "#a0cfd0" })
	set(0, "Number", { fg = "#bccbb0" })
	set(0, "Type", { fg = "#a8d292" })
	set(0, "Identifier", { fg = "#e1e4da" })

	-- Diagnostics
	set(0, "DiagnosticError", { fg = "#ffb4ab" })
	set(0, "DiagnosticWarn", { fg = "#a0cfd0" })
	set(0, "DiagnosticInfo", { fg = "#bccbb0" })
	set(0, "DiagnosticHint", { fg = "#a8d292" })

	-- Visual selection
	set(0, "Visual", { bg = "#272b25" })

	-- Statusline (used by LazyVim's lualine)
	set(0, "StatusLine", { fg = "#e1e4da", bg = "#1d211a" })
	set(0, "StatusLineNC", { fg = "#8d9387", bg = "#11140f" })

	-- Popup menu
	set(0, "Pmenu", { fg = "#e1e4da", bg = "#1d211a" })
	set(0, "PmenuSel", { fg = "#153808", bg = "#a8d292" })
	set(0, "PmenuSbar", { bg = "#1d211a" })
	set(0, "PmenuThumb", { bg = "#a8d292" })
end
