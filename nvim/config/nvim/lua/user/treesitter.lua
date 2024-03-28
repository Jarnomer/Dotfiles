local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}

function M.config()
	local servers = {
		"markdown",
		"markdown_inline",
		"gitignore",
		"vim",
		"regex",
		"lua",
		"bash",
		"make",
		"c",
		"cpp",
		"rust",
	}

	require("nvim-treesitter.configs").setup({
		ensure_installed = servers,
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
		autopairs = { enable = true },
		autotag = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<a-space>",
				node_incremental = "<a-space>",
				node_decremental = "<a-backspace>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["aa"] = { query = "@parameter.outer", desc = "Outer parameter" },
					["ao"] = { query = "@conditional.outer", desc = "Outer conditional" },
					["af"] = { query = "@function.outer", desc = "Outer function" },
					["ac"] = { query = "@call.outer", desc = "Outer call" },
					["al"] = { query = "@loop.outer", desc = "Outer loop" },
					["ae"] = { query = "@statement.outer", desc = "Outer statement" },
					["ar"] = { query = "@return.outer", desc = "Outer return" },
					["a/"] = { query = "@comment.outer", desc = "Outer comment" },

					["ia"] = { query = "@parameter.inner", desc = "Inner parameter" },
					["io"] = { query = "@conditional.inner", desc = "Inenr conditional" },
					["if"] = { query = "@function.inner", desc = "Inner function" },
					["ic"] = { query = "@call.inner", desc = "Inner call" },
					["il"] = { query = "@loop.inner", desc = "Inner loop" },
					["ir"] = { query = "@return.inner", desc = "Inner return" },
				},
			},
		},
	})
end

return M
