local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	local wk = require("which-key")
	local harpoon = require("harpoon")

	harpoon:setup({})

	harpoon:extend({
		UI_CREATE = function(cx)
			vim.keymap.set("n", "<C-v>", function()
				harpoon.ui:select_menu_item({ vsplit = true })
			end, { buffer = cx.bufnr })

			vim.keymap.set("n", "<C-x>", function()
				harpoon.ui:select_menu_item({ split = true })
			end, { buffer = cx.bufnr })

			vim.keymap.set("n", "<C-t>", function()
				harpoon.ui:select_menu_item({ tabedit = true })
			end, { buffer = cx.bufnr })
		end,
	})

	-- harpoon:extend(extensions.builtins.navigate_with_number())

	local conf = require("telescope.config").values
	local function toggle_telescope(harpoon_files)
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end

		require("telescope.pickers")
			.new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			})
			:find()
	end

	vim.keymap.set("n", "<C-e>", function()
		toggle_telescope(harpoon:list())
	end, { desc = "Open harpoon window" })

	wk.register({
		["<leader>ha"] = {
			function()
				harpoon:list():add()
			end,
			"Add",
		},
		["<leader>ht"] = {
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			"Toggle",
		},
		["<leader>hn"] = {
			function()
				harpoon:list():next()
			end,
			"Next",
		},
		["<leader>hp"] = {
			function()
				harpoon:list():prev()
			end,
			"Prev",
		},
		["<leader>h1"] = {
			function()
				harpoon:list():select(1)
			end,
			"1",
		},
	})
end

return M
