return function()
	local set = vim.api.nvim_set_hl

	-- Base UI
	set(0, "Normal", { fg = "#e1e2e9", bg = "#111318" })
	set(0, "NormalFloat", { fg = "#e1e2e9", bg = "#1d2024" })
	set(0, "CursorLine", { bg = "#282a2f" })
	set(0, "CursorLineNr", { fg = "#a5c8ff", bold = true })
	set(0, "LineNr", { fg = "#8d9199" })
	set(0, "NeoTreeNormal", { bg = "#111318" })
	set(0, "NeoTreeNormalNC", { bg = "#111318" })
	set(0, "NeoTreeFloatBorder", { fg = "#8d9199" })
	-- Syntax
	set(0, "Comment", { fg = "#8d9199", italic = true })
	set(0, "Keyword", { fg = "#a5c8ff", bold = true })
	set(0, "Function", { fg = "#bcc7dc" })
	set(0, "String", { fg = "#dabde2" })
	set(0, "Number", { fg = "#bcc7dc" })
	set(0, "Type", { fg = "#a5c8ff" })
	set(0, "Identifier", { fg = "#e1e2e9" })

	-- Diagnostics
	set(0, "DiagnosticError", { fg = "#ffb4ab" })
	set(0, "DiagnosticWarn", { fg = "#dabde2" })
	set(0, "DiagnosticInfo", { fg = "#bcc7dc" })
	set(0, "DiagnosticHint", { fg = "#a5c8ff" })

	-- Visual selection
	set(0, "Visual", { bg = "#282a2f" })

	-- Statusline (used by LazyVim's lualine)
	set(0, "StatusLine", { fg = "#e1e2e9", bg = "#1d2024" })
	set(0, "StatusLineNC", { fg = "#8d9199", bg = "#111318" })

	-- Popup menu
	set(0, "Pmenu", { fg = "#e1e2e9", bg = "#1d2024" })
	set(0, "PmenuSel", { fg = "#00315e", bg = "#a5c8ff" })
	set(0, "PmenuSbar", { bg = "#1d2024" })
	set(0, "PmenuThumb", { bg = "#a5c8ff" })
end
