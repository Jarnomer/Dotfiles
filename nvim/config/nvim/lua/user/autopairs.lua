local M = {
	"windwp/nvim-autopairs",
}

M.config = function()
	require("nvim-autopairs").setup {
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
	}
end

return M
