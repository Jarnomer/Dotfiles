local M = {
	"glepnir/lspsaga.nvim",
	lazy = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}

function M.config()
	require("lspsaga").setup({
		move_in_saga = { prev = "<C-k>", next = "<C-j>" },
		finder_action_keys = {
			open = "<CR>",
		},
		definition_action_keys = {
			edit = "<CR>",
		},
	})
end
return M
