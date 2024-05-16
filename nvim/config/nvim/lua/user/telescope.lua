local M = {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"debugloop/telescope-undo.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			lazy = true,
		},
	},
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Files" },
		["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Text" },
		["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
		["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent" },
		["<leader>fp"] = { "<cmd>Telescope resume<cr>", "Previous" },
		["<leader>fq"] = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
		["<leader>fc"] = { "<cmd>Telescope commands<cr>", "Commands" },
		["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
		["<leader>fm"] = { "<cmd>Telescope man_pages<cr>", "Manual" },
		["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		["<leader>fl"] = { "<cmd>Telescope highlights<cr>", "Highlights" },

		["<leader>fu"] = { "<cmd>Telescope undo<cr>", "Undo" },
		["<leader>fy"] = { "<cmd>Telescope neoclip<cr>", "Yanked" },

		["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Branch" },
		["<leader>gs"] = { "<cmd>Telescope git_status<cr>", "Status" },
	})

	local icons = require("user.icons")
	local actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			color_devicons = true,
			prompt_prefix = icons.ui.Search .. " ",
			selection_caret = icons.ui.BoldArrowRight .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "descending",
			layout_strategy = "center",
			path_display = { "smart" },
			layout_config = {
				horizontal = {
					mirror = false,
				},
				vertical = {
					width = 0.8,
					mirror = false,
				},
			},
			file_ignore_patterns = {
				".git",
				"build",
			},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
				},
				n = {
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["<esc>"] = actions.close,
					["q"] = actions.close,
				},
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
			},
			grep_string = {
				theme = "dropdown",
			},
			find_files = {
				theme = "dropdown",
				previewer = false,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
				initial_mode = "normal",
				mappings = {
					i = { ["<C-d>"] = actions.delete_buffer },
					n = { ["dd"] = actions.delete_buffer },
				},
			},
			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_implementations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			undo = {
				-- telescope-undo.nvim config, see below
			},
		},
		require("telescope").load_extension("fzf"),
		require("telescope").load_extension("ui-select"),
		require("telescope").load_extension("undo"),
		require("telescope").load_extension("neoclip"),
	})
end

return M
