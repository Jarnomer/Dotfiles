local M = {
	"folke/todo-comments.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	local icons = require("user.icons")
	require("todo-comments").setup({
		keywords = {
			FIX = { icon = icons.ui.Bug, alt = { "FIXME", "FIXIT", "BUG", "ISSUE" } },
			TODO = { icon = icons.ui.Check },
			NOTE = { icon = icons.diagnostics.Information, alt = { "INFO" } },
			WARN = { icon = icons.diagnostics.Warning, alt = { "WARNING", "ALERT" } },
		},
	})
end

return M
