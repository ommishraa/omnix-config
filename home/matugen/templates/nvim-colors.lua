return function()
	local set = vim.api.nvim_set_hl

	-- Base UI
	set(0, "Normal", { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface.default.hex}}" })
	set(0, "NormalFloat", { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface_container.default.hex}}" })
	set(0, "CursorLine", { bg = "{{colors.surface_container_high.default.hex}}" })
	set(0, "CursorLineNr", { fg = "{{colors.primary.default.hex}}", bold = true })
	set(0, "LineNr", { fg = "{{colors.outline.default.hex}}" })
	set(0, "NeoTreeNormal", { bg = "{{colors.surface.default.hex}}" })
	set(0, "NeoTreeNormalNC", { bg = "{{colors.surface.default.hex}}" })
	set(0, "NeoTreeFloatBorder", { fg = "{{colors.outline.default.hex}}" })
	-- Syntax
	set(0, "Comment", { fg = "{{colors.outline.default.hex}}", italic = true })
	set(0, "Keyword", { fg = "{{colors.primary.default.hex}}", bold = true })
	set(0, "Function", { fg = "{{colors.secondary.default.hex}}" })
	set(0, "String", { fg = "{{colors.tertiary.default.hex}}" })
	set(0, "Number", { fg = "{{colors.secondary.default.hex}}" })
	set(0, "Type", { fg = "{{colors.primary.default.hex}}" })
	set(0, "Identifier", { fg = "{{colors.on_surface.default.hex}}" })

	-- Diagnostics
	set(0, "DiagnosticError", { fg = "{{colors.error.default.hex}}" })
	set(0, "DiagnosticWarn", { fg = "{{colors.tertiary.default.hex}}" })
	set(0, "DiagnosticInfo", { fg = "{{colors.secondary.default.hex}}" })
	set(0, "DiagnosticHint", { fg = "{{colors.primary.default.hex}}" })

	-- Visual selection
	set(0, "Visual", { bg = "{{colors.surface_container_high.default.hex}}" })

	-- Statusline (used by LazyVim's lualine)
	set(0, "StatusLine", { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface_container.default.hex}}" })
	set(0, "StatusLineNC", { fg = "{{colors.outline.default.hex}}", bg = "{{colors.surface.default.hex}}" })

	-- Popup menu
	set(0, "Pmenu", { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface_container.default.hex}}" })
	set(0, "PmenuSel", { fg = "{{colors.on_primary.default.hex}}", bg = "{{colors.primary.default.hex}}" })
	set(0, "PmenuSbar", { bg = "{{colors.surface_container.default.hex}}" })
	set(0, "PmenuThumb", { bg = "{{colors.primary.default.hex}}" })
end
