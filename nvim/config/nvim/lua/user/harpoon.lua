local M = {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>bb"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>.", "Bookmarks" },
		["<leader>ba"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add" },
		["<leader>bn"] = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next" },
		["<leader>bp"] = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Prev" },
		["<leader>b1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "1st" },
	})
	-- function M.mark_file()
	-- 	require("harpoon.mark").add_file()
	-- 	vim.notify("  bookmark added")
	-- end
end

return M
