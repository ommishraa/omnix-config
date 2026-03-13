return function()
	local set = vim.api.nvim_set_hl

	-- Base UI
	set(0, "Normal", { fg = "#e0e3e8", bg = "#101417" })
	set(0, "NormalFloat", { fg = "#e0e3e8", bg = "#1c2024" })
	set(0, "CursorLine", { bg = "#262a2e" })
	set(0, "CursorLineNr", { fg = "#95cdf7", bold = true })
	set(0, "LineNr", { fg = "#8b9198" })
	set(0, "NeoTreeNormal", { bg = "#101417" })
	set(0, "NeoTreeNormalNC", { bg = "#101417" })
	set(0, "NeoTreeFloatBorder", { fg = "#8b9198" })
	-- Syntax
	set(0, "Comment", { fg = "#8b9198", italic = true })
	set(0, "Keyword", { fg = "#95cdf7", bold = true })
	set(0, "Function", { fg = "#b7c9d9" })
	set(0, "String", { fg = "#cfc0e8" })
	set(0, "Number", { fg = "#b7c9d9" })
	set(0, "Type", { fg = "#95cdf7" })
	set(0, "Identifier", { fg = "#e0e3e8" })

	-- Diagnostics
	set(0, "DiagnosticError", { fg = "#ffb4ab" })
	set(0, "DiagnosticWarn", { fg = "#cfc0e8" })
	set(0, "DiagnosticInfo", { fg = "#b7c9d9" })
	set(0, "DiagnosticHint", { fg = "#95cdf7" })

	-- Visual selection
	set(0, "Visual", { bg = "#262a2e" })

	-- Statusline (used by LazyVim's lualine)
	set(0, "StatusLine", { fg = "#e0e3e8", bg = "#1c2024" })
	set(0, "StatusLineNC", { fg = "#8b9198", bg = "#101417" })

	-- Popup menu
	set(0, "Pmenu", { fg = "#e0e3e8", bg = "#1c2024" })
	set(0, "PmenuSel", { fg = "#00344e", bg = "#95cdf7" })
	set(0, "PmenuSbar", { bg = "#1c2024" })
	set(0, "PmenuThumb", { bg = "#95cdf7" })
end
