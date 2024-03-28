local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
}

function M.config()
	local dashboard = require("alpha.themes.dashboard")
	local icons = require("user.icons")

	local function button(sc, txt, keybind, keybind_opts)
		local b = dashboard.button(sc, txt, keybind, keybind_opts)
		b.opts.hl_shortcut = "Include"
		return b
	end

	local logo = {
		[[ ███       ███ ]],
		[[█████      ████]],
		[[███████     █████]],
		[[████████    █████]],
		[[█████████   █████]],
		[[█████████  █████]],
		[[█████ ████ █████]],
		[[█████  █████████]],
		[[█████   █████████]],
		[[█████    ████████]],
		[[█████     ███████]],
		[[████      █████]],
		[[ ███       ███ ]],
		[[                  ]],
		[[ N  E  O  V  I  M ]],
	}

	dashboard.section.header.val = logo

	dashboard.section.buttons.val = {
		button("f", icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
		button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
		button("r", icons.ui.History .. " Recent file", ":Telescope oldfiles <CR>"),
		button("t", icons.ui.Text .. " Find text", ":Telescope live_grep <CR>"),
		button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
		button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
	}

	local function footer()
		local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
		local version = vim.version()
		local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
		return datetime .. "   " .. " plugins" .. nvim_version_info
	end

	dashboard.section.footer.val = footer()

	dashboard.section.header.opts.hl = "Keyword"
	dashboard.section.buttons.opts.hl = "Include"
	dashboard.section.footer.opts.hl = "Type"

	dashboard.opts.opts.noautocmd = true
	require("alpha").setup(dashboard.opts)

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
			pcall(vim.cmd.AlphaRedraw)
		end,
	})

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = { "AlphaReady" },
		callback = function()
			vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
		end,
	})
end

return M