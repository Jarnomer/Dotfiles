local M = {
	"rebelot/kanagawa.nvim",
	priority = 1000,
}

function M.config()
	require("kanagawa").setup({
		terminalColors = true,
		commentStyle = {},
		functionStyle = { bold = true },
		keywordStyle = { italic = true },
		statementStyle = {},
		transparent = false,
		colors = {
			palette = {
				samuraiRed = "#ED6060",
				roninYellow = "#D69758",
				dragonBlack0 = "#191919",
				dragonBlack3 = "#100F0F",
			},
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
					float = {
						bg = "none",
					},
					syn = {
						fun = "#A394CE",
					},
				},
			},
		},
		overrides = function(colors)
			local theme = colors.theme
			return {
				NormalFloat = { bg = theme.ui.bg_m3 },
				FloatBorder = { bg = theme.ui.bg_m3 },
				FloatTitle = { bg = theme.ui.bg_m3 },
				NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
				LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_m3 },
				PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },

				TelescopeTitle = { fg = theme.ui.special, bold = true },
				TelescopePromptNormal = { bg = theme.ui.bg_m1 },
				TelescopePromptBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
				TelescopeResultsNormal = { fg = theme.ui.fg_m3, bg = theme.ui.bg_m3 },
				TelescopeResultsBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
				TelescopePreviewNormal = { bg = theme.ui.bg_m3 },
				TelescopePreviewBorder = { bg = theme.ui.bg_m3, fg = theme.ui.bg_m3 },

				LspDiagnosticsFloatingError = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
				LspDiagnosticsFloatingWarning = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
				LspDiagnosticsFloatingInformation = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },

				NoiceCmdlinePopup = { bg = theme.ui.bg_m3 },
				NoiceCmdlinePopupBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
				NoiceCmdlinePopupBorderSearch = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
				NoiceComfirm = { bg = theme.ui.bg_m3 },
				NoiceComfirmBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
				NoicePopup = { bg = theme.ui.bg_m3 },
				NoicePopupBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
				NoicePopupMenu = { bg = theme.ui.bg_m3 },
				NoicePopupMenuBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
			}
		end,
		theme = "dragon",
		background = {
			dark = "dragon",
			light = "dragon",
		},
	})
	vim.cmd.colorscheme("kanagawa-dragon")
end

return M
