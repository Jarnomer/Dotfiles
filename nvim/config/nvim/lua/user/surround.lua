local M = {
	"kylechui/nvim-surround",
	event = { "BufReadPost", "BufNewFile" },
}

function M.config()
	require("nvim-surround").setup {

	}
end

return M
