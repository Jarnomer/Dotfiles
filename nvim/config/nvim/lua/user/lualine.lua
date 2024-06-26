local M = {
	"nvim-lualine/lualine.nvim",
}

function M.config()
	local icons = require("user.icons")
	local lazy_status = require("lazy.status")
	local theme = require("kanagawa.colors").setup().theme

	-- local harpoon = require("harpoon.mark")
	-- local function harpoon_component()
	-- 	local total_marks = harpoon.get_length()
	--
	-- 	if total_marks == 0 then
	-- 		return ""
	-- 	end
	--
	-- 	local current_mark = ""
	--
	-- 	local mark_idx = harpoon.get_current_index()
	-- 	if mark_idx ~= nil then
	-- 		current_mark = tostring(mark_idx)
	-- 	end
	--
	-- 	return string.format(" %s/%d", current_mark, total_marks)
	-- end

	local mode_map = {
		["NORMAL"] = "N",
		["O-PENDING"] = "N?",
		["INSERT"] = "I",
		["VISUAL"] = "V",
		["V-BLOCK"] = "VB",
		["V-LINE"] = "VL",
		["V-REPLACE"] = "VR",
		["REPLACE"] = "R",
		["COMMAND"] = "!",
		["SHELL"] = "SH",
		["TERMINAL"] = "T",
		["EX"] = "X",
		["S-BLOCK"] = "SB",
		["S-LINE"] = "SL",
		["SELECT"] = "S",
		["CONFIRM"] = "Y?",
		["MORE"] = "M",
	}
	local kanagawa = {}
	kanagawa.normal = {
		a = { bg = theme.syn.fun, fg = theme.ui.bg_m3, gui = "bold" },
		b = { bg = theme.diff.change, fg = theme.syn.fun },
		c = { bg = theme.ui.bg_m3, fg = theme.ui.fg },
	}
	kanagawa.insert = {
		a = { bg = theme.diag.ok, fg = theme.ui.bg, gui = "bold" },
		b = { bg = theme.ui.bg, fg = theme.diag.ok },
	}
	kanagawa.command = {
		a = { bg = theme.syn.operator, fg = theme.ui.bg, gui = "bold" },
		b = { bg = theme.ui.bg, fg = theme.syn.operator },
	}
	kanagawa.visual = {
		a = { bg = theme.syn.keyword, fg = theme.ui.bg, gui = "bold" },
		b = { bg = theme.ui.bg, fg = theme.syn.keyword },
	}
	kanagawa.replace = {
		a = { bg = theme.syn.constant, fg = theme.ui.bg },
		b = { bg = theme.ui.bg, fg = theme.syn.constant },
	}
	kanagawa.inactive = {
		a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
		b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
		c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	}

	if vim.g.kanagawa_lualine_bold then
		for _, mode in pairs(kanagawa) do
			mode.a.gui = "bold"
		end
	end

	local empty = require("lualine.component"):extend()
	function empty:draw(default_highlight)
		self.status = ""
		self.applied_separator = ""
		self:apply_highlights(default_highlight)
		self:apply_section_separators()
		return self.status
	end

	local function process_sections(sections)
		for name, section in pairs(sections) do
			local left = name:sub(9, 10) < "x"
			for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
				table.insert(section, pos * 2, { empty, color = { fg = theme.ui.fg, bg = theme.ui.bg } })
			end
			for id, comp in ipairs(section) do
				if type(comp) ~= "table" then
					comp = { comp }
					section[id] = comp
				end
				comp.separator = left and { right = "" } or { left = "" }
			end
		end
		return sections
	end

	require("lualine").setup({
		options = {
			theme = kanagawa,
			icons_enabled = true,
			section_separators = {
				left = "",
				right = "",
			},
			component_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
		},
		sections = process_sections({
			lualine_a = {
				{
					"mode",
					fmt = function(s)
						return mode_map[s] or s
					end,
				},
			},
			lualine_b = {
				"branch",
				{
					"diff",
					symbols = {
						added = icons.git.LineAdded,
						modified = icons.git.LineModified,
						removed = icons.git.LineRemoved,
					},
				},
			},
			lualine_c = {
				-- { "filetype", colored = false, icon_only = true },
				{
					"filename",
					path = 0,
					symbols = {
						modified = icons.ui.FileModified,
						readonly = icons.ui.ReadOnly,
						unnamed = icons.ui.NewFile,
						newfile = icons.ui.NewFile,
					},
				},
			},
			lualine_x = {
				{
					lazy_status.updates,
					cond = lazy_status.has_updates,
					color = { fg = "#D69758" },
				},
			},
			lualine_y = {
				{
					"diagnostics",
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warning,
						info = icons.diagnostics.Information,
						hint = icons.diagnostics.Hint,
					},
					colored = true,
					update_in_insert = false,
					always_visible = false,
				},
				-- harpoon_component,
			},
			lualine_z = { "location" },
		}),
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
