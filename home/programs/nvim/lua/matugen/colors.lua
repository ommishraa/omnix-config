return function()
	local set = vim.api.nvim_set_hl

	-- Base UI
	set(0, "Normal", { fg = "#dee3e6", bg = "#0f1416" })
	set(0, "NormalFloat", { fg = "#dee3e6", bg = "#1b2023" })
	set(0, "CursorLine", { bg = "#252b2d" })
	set(0, "CursorLineNr", { fg = "#88d1ec", bold = true })
	set(0, "LineNr", { fg = "#8a9296" })
	set(0, "NeoTreeNormal", { bg = "#0f1416" })
	set(0, "NeoTreeNormalNC", { bg = "#0f1416" })
	set(0, "NeoTreeFloatBorder", { fg = "#8a9296" })
	-- Syntax
	set(0, "Comment", { fg = "#8a9296", italic = true })
	set(0, "Keyword", { fg = "#88d1ec", bold = true })
	set(0, "Function", { fg = "#b3cad4" })
	set(0, "String", { fg = "#c3c3eb" })
	set(0, "Number", { fg = "#b3cad4" })
	set(0, "Type", { fg = "#88d1ec" })
	set(0, "Identifier", { fg = "#dee3e6" })

	-- Diagnostics
	set(0, "DiagnosticError", { fg = "#ffb4ab" })
	set(0, "DiagnosticWarn", { fg = "#c3c3eb" })
	set(0, "DiagnosticInfo", { fg = "#b3cad4" })
	set(0, "DiagnosticHint", { fg = "#88d1ec" })

	-- Visual selection
	set(0, "Visual", { bg = "#252b2d" })

	-- Statusline (used by LazyVim's lualine)
	set(0, "StatusLine", { fg = "#dee3e6", bg = "#1b2023" })
	set(0, "StatusLineNC", { fg = "#8a9296", bg = "#0f1416" })

	-- Popup menu
	set(0, "Pmenu", { fg = "#dee3e6", bg = "#1b2023" })
	set(0, "PmenuSel", { fg = "#003544", bg = "#88d1ec" })
	set(0, "PmenuSbar", { bg = "#1b2023" })
	set(0, "PmenuThumb", { bg = "#88d1ec" })
end
