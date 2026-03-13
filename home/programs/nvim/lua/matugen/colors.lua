return function()
	local set = vim.api.nvim_set_hl

	-- Base UI
	set(0, "Normal", { fg = "#e0e2e8", bg = "#101418" })
	set(0, "NormalFloat", { fg = "#e0e2e8", bg = "#1c2024" })
	set(0, "CursorLine", { bg = "#272a2f" })
	set(0, "CursorLineNr", { fg = "#9acbfa", bold = true })
	set(0, "LineNr", { fg = "#8c9198" })
	set(0, "NeoTreeNormal", { bg = "#101418" })
	set(0, "NeoTreeNormalNC", { bg = "#101418" })
	set(0, "NeoTreeFloatBorder", { fg = "#8c9198" })
	-- Syntax
	set(0, "Comment", { fg = "#8c9198", italic = true })
	set(0, "Keyword", { fg = "#9acbfa", bold = true })
	set(0, "Function", { fg = "#b9c8da" })
	set(0, "String", { fg = "#d2bfe7" })
	set(0, "Number", { fg = "#b9c8da" })
	set(0, "Type", { fg = "#9acbfa" })
	set(0, "Identifier", { fg = "#e0e2e8" })

	-- Diagnostics
	set(0, "DiagnosticError", { fg = "#ffb4ab" })
	set(0, "DiagnosticWarn", { fg = "#d2bfe7" })
	set(0, "DiagnosticInfo", { fg = "#b9c8da" })
	set(0, "DiagnosticHint", { fg = "#9acbfa" })

	-- Visual selection
	set(0, "Visual", { bg = "#272a2f" })

	-- Statusline (used by LazyVim's lualine)
	set(0, "StatusLine", { fg = "#e0e2e8", bg = "#1c2024" })
	set(0, "StatusLineNC", { fg = "#8c9198", bg = "#101418" })

	-- Popup menu
	set(0, "Pmenu", { fg = "#e0e2e8", bg = "#1c2024" })
	set(0, "PmenuSel", { fg = "#003352", bg = "#9acbfa" })
	set(0, "PmenuSbar", { bg = "#1c2024" })
	set(0, "PmenuThumb", { bg = "#9acbfa" })
end
