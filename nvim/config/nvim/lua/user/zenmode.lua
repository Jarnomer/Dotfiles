local M = {
	"folke/zen-mode.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>z"] = { "<cmd>ZenMode<cr>", "Zenmode" },
	})
	require("zen-mode").setup({
		window = {
			backdrop = 1,
			height = 1,
			width = 0.6,
			options = {
				signcolumn = "no",
				number = false,
				relativenumber = false,
				cursorline = false,
				cursorcolumn = false,
				foldcolumn = "0",
				list = false,
			},
		},
		plugins = {
			kitty = {
				enabled = false,
				font = "+8",
			},
		},
	})
end

return M
