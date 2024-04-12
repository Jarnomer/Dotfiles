local M = {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}

local icons = require("user.icons")

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>lc"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		["<leader>lr"] = { "<cmd>Lspsaga rename<cr>", "Rename" },
		["<leader>lh"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover" },
		["<leader>lj"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next" },
		["<leader>lk"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev" },
	})
	require("lspsaga").setup({
		symbol_in_winbar = {
			enable = false,
			color_mode = false,
			separator = icons.ui.ChevronBreadCrumb,
		},
		lightbulb = {
			enable = false,
		},
		move_in_saga = {
			prev = "<C-k>",
			next = "<C-j>",
		},
		finder_action_keys = {
			open = "<CR>",
		},
		definition_action_keys = {
			edit = "<CR>",
		},
	})
end
return M
