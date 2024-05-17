local M = {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"nvim-neotest/nvim-nio",
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = {
				"williamboman/mason.nvim",
				"mfussenegger/nvim-dap",
				"theHamsta/nvim-dap-virtual-text",
				"folke/neodev.nvim",
			},
		},
	},
}

function M.config()
	local dap = require("dap")
	local dapui = require("dapui")
	local dapvt = require("nvim-dap-virtual-text")
	local icons = require("user.icons")

	vim.fn.sign_define("DapBreakpoint", { text = icons.dap.Breakpoint })

	local function dap_clear_breakpoints()
		dap.clear_breakpoints()
	end

	local wk = require("which-key")
	wk.register({
		["<leader>db"] = { "<cmd>DapToggleBreakpoint<cr>", "Break" },
		["<leader>dr"] = { "<cmd>DapContinue<cr>", "Run" },
		["<leader>de"] = { "<cmd>DapTerminate<cr>", "End" },
		["<leader>di"] = { "<cmd>DapStepInto<cr>", "Step in" },
		["<leader>do"] = { "<cmd>DapStepOut<cr>", "Step out" },
		["<leader>dO"] = { "<cmd>DapStepOver<cr>", "Step over" },
		["<leader>dC"] = { dap_clear_breakpoints, "Clear" },
	})
	require("mason-nvim-dap").setup({
		automatic_installation = false,
		automatic_setup = true,
		handlers = {},
		ensure_installed = {
			"clangd",
		},
	})
	require("neodev").setup({
		library = { plugins = { "nvim-dap-ui" }, types = true },
	})

	dapui.setup({
		icons = {
			expanded = "asd",
		},
		controls = {
			icons = {
				play = icons.dap.Play,
				pause = icons.dap.Pause,
				terminate = icons.dap.Stop,
				step_back = icons.dap.Back,
				step_into = icons.dap.In,
				step_out = icons.dap.Out,
				step_over = icons.dap.Over,
				run_last = icons.dap.RunLast,
			},
		},
	})

	dapvt.setup()

	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end

return M
