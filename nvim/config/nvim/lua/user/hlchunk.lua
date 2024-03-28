local M = {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
}

function M.config()
	require("hlchunk").setup({
		chunk = {
			chars = {
				right_arrow = "",
			},
		},
		indent = {
			chars = { "│", "¦", "┆", "┊" },
		},
		blank = {
			enable = false,
		},
	})
end

return M
