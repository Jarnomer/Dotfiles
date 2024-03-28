local M = {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"cacharle/c_formatter_42.vim",
	},
}

function M.config()
	require("conform").setup({
		notify_on_error = false,
		formatters_by_ft = {
			c = { "clang-format" },
			lua = { "stylua" },
		},
		formatters = {
			my_formatter = {
				command = "<Cmd>CFormatter42<CR>",
			},
		},
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 1000,
				async = false,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
	})

	-- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	-- 	conform.format({
	-- 		lsp_fallback = true,
	-- 		async = false,
	-- 		timeout_ms = 1000,
	-- 	})
	-- end, { desc = "Format file or range (in visual mode)" })
end

return M
