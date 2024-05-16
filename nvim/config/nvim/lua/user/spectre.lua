local M = {
	"nvim-pack/nvim-spectre",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>st"] = { "<cmd>lua require('spectre').toggle()<CR>", "Toggle" },
		["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Word" },
		["<leader>sf"] = { "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", "File" },
	})
	require("spectre").setup({
		highlight = {
			search = "SpectreSearch",
			replace = "SpectreReplace",
		},
		mapping = {
			["send_to_qf"] = {
				map = "<C-q>",
				cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
				desc = "send all items to quickfix",
			},
		},
		replace = {
			sed = {
				cmd = "sed",
			},
		},
	})
end

return M
