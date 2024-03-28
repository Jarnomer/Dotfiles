local M = {
	"neogitorg/neogit",
	event = "VeryLazy",
}

function M.config()
	local icons = require "user.icons"
	local wk = require "which-key"
	wk.register {
		["<leader>gg"] = { "<cmd>Neogit<CR>", "Neogit" },
	}

	require("neogit").setup {
		auto_refresh = true,
		disable_builtin_notifications = false,
		use_magit_keybindings = false,
		kind = "split",
		commit_popup = {
			kind = "split",
		},
		popup = {
			kind = "split",
		},
		signs = {
			section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
			item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
			hunk = { "", "" },
		},
	}
end

return M
