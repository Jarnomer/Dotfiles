local M = {
	"karb94/neoscroll.nvim",
}

function M.config()
	vim.cmd [[
  nnoremap <C-j> <C-D>
  vnoremap <C-j> <C-D>

  nnoremap <C-k> <C-U>
  vnoremap <C-k> <C-U>
]]

	require("neoscroll").setup {
		mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb", "C-k", "C-j",
			"C-Down", "C-Up", "S-Down", "S-Up", "C-S-Down", "C-S-Up"},
		hide_cursor = true,
		stop_eof = true,
		respect_scrolloff = false,
		cursor_scrolls_alone = true,
		easing_function = nil,
		pre_hook = nil,
		post_hook = nil,
		performance_mode = false,
	}

	local t = {}
	t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
	t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
	t["<C-k>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
	t["<C-j>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
	t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
	t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
	t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
	t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
	t["zt"] = { "zt", { "250" } }
	t["zz"] = { "zz", { "250" } }
	t["zb"] = { "zb", { "250" } }

	-- t["<S-Up>"] = { "scroll", { "-vim.wo.scroll", "true", "10" } }
	-- t["<S-Down>"] = { "scroll", { "vim.wo.scroll", "true", "10" } }
	t["<C-Up>"] = { "scroll", { "-vim.wo.scroll", "true", "200" } }
	t["<C-Down>"] = { "scroll", { "vim.wo.scroll", "true", "200" } }
	t["<C-S-Up>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "300" } }
	t["<C-S-Down>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "300" } }
	require("neoscroll.config").set_mappings(t)
end

return M

