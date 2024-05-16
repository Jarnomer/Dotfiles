local M = {
	"echasnovski/mini.nvim",
}

function M.config()
	require("mini.cursorword").setup()
	require("mini.pairs").setup()
	require("mini.comment").setup()
	require("mini.surround").setup()
	require("mini.move").setup({
		mappings = {
			left = "<M-C-Left>",
			right = "<M-C-Right>",
			down = "<M-C-Down>",
			up = "<M-C-Up>",
			line_left = "<M-C-Left>",
			line_right = "<M-C-Right>",
			line_down = "<M-C-Down>",
			line_up = "<M-C-Up>",
		},
	})
end

return M
