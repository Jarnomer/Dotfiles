local M = {
	"folke/which-key.nvim",
}

function M.config()
	vim.o.timeout = true
	vim.o.timeoutlen = 500
	local mappings = {
		p = {
			name = "Plugins",
			l = { "<cmd>Lazy<cr>", "Lazy" },
			m = { "<cmd>Mason<cr>", "Mason" },
		},
		a = {
			name = "Tab",
			n = { "<cmd>$tabnew<cr>", "New" },
			N = { "<cmd>tabnew %<cr>", "Dup" },
			x = { "<cmd>tabclose<cr>", "Close" },
			j = { "<cmd>tabp<cr>", "Prev" },
			k = { "<cmd>tabn<cr>", "Next" },
			h = { "<cmd>-tabmove<cr>", "Left" },
			l = { "<cmd>+tabmove<cr>", "Right" },
			o = { "<cmd>tabonly<cr>", "Only" },
		},
		v = { "<cmd>vsplit<cr>", "Split" },
		w = { "<cmd>w<cr>", "Write" },
		q = { "<cmd>q<cr>", "Quit" },
		x = { "<cmd>wq<cr>", "Exit" },
		f = { name = "Find" },
		h = { name = "Harpoon" },
		s = { name = "Spectre" },
		g = { name = "Git" },
		l = { name = "Lsp" },
		d = { name = "Debug" },
	}
	local icons = require("user.icons")
	local which_key = require("which-key")
	which_key.setup({
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
	})
	local opts = {
		mode = "n",
		prefix = "<leader>",
	}
	which_key.register(mappings, opts)
end

return M
