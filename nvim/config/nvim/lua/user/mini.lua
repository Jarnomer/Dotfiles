local M = {
	"echasnovski/mini.nvim",
}

function M.config()
	require("mini.cursorword").setup()
	require("mini.animate").setup()
end
return M
