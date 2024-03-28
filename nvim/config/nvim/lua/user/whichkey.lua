local M = {
	"folke/which-key.nvim",
}

function M.config()
	vim.o.timeout = true
	vim.o.timeoutlen = 500

	local mappings = {

		h = { "<cmd>nohlsearch<CR>", "NoHL" },
		v = { "<cmd>vsplit<CR>", "Split" },

		q = {
			name = "Quit",
			q = { "<cmd>confirm q<cr>", "Confirm" },
			f = { "<cmd>q!<cr>", "Force" },
			w = { "<cmd>wq<cr>", "Write" },
			a = { "<cmd>qa<cr>", "Save all" },
		},

		p = {
			name = "Plugins",
			l = { "<cmd>Lazy<cr>", "Lazy" },
			m = { "<cmd>Mason<cr>", "Mason" },
		},

		a = {
			name = "Tab",
			n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
			N = { "<cmd>tabnew %<cr>", "New Tab" },
			o = { "<cmd>tabonly<cr>", "Only" },
			h = { "<cmd>-tabmove<cr>", "Move Left" },
			l = { "<cmd>+tabmove<cr>", "Move Right" },
		},

		f = { name = "Find" },
		b = { name = "Bookmark" },
		g = { name = "Git" },
		l = { name = "LSP" },
		d = { name = "Debug" },

	}

	local icons = require "user.icons"
	local which_key = require "which-key"
	which_key.setup {
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false,
			},
		},
		window = {
			border = "none",
			position = "bottom",
			padding = { 1, 2, 1, 2 },
			winblend = 0,
		},
		icons = {
			breadcrumb = icons.ui.DoubleChevronRight,
			separator = icons.ui.BoldArrowLeft,
			group = icons.ui.Group,
		},
		layout = {
			height = { min = 2, max = 4 },
			width = { min = 5, max = 30 },
			spacing = 2,
			align = "left",
		},
		ignore_missing = true,
		show_help = false,
		show_keys = false,
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	}

	local opts = {
		mode = "n",
		prefix = "<leader>",
	}

	which_key.register(mappings, opts)
end

return M
