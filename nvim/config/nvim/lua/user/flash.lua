local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>j"] = {
			function()
				require("flash").jump()
			end,
			"Jump",
		},
	})
	require("flash").setup({})
end

return M
