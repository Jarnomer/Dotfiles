local M = {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	require("conform").setup({
		notify_on_error = false,
		formatters_by_ft = {
			c = { "clang-format" },
			lua = { "stylua" },
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
	vim.keymap.set({ "n", "v" }, "<leader>xxx", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		})
	end)
end

return M
