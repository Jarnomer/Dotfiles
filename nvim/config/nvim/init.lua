-- CORE MODULES
require("user.options")
require("user.launch")
require("user.keymaps")
require("user.autocmds")
require("user.icons")

-- USER INTERFACE
spec("user.kanagawa")
spec("user.treesitter")
spec("user.gitsigns")
spec("user.hlchunk")
spec("user.lualine")
spec("user.alpha")
spec("user.noice")
spec("user.tabby")

-- LSP/CMP/DAP/FMT
spec("user.cmp")
spec("user.mason")
spec("user.lspconfig")
spec("user.conform")
spec("user.dap")

-- FILE MANAGEMENT
spec("user.telescope")
spec("user.nvimtree")
spec("user.harpoon")

-- UTILITIES
spec("user.mini")
spec("user.whichkey")
spec("user.toggleterm")
spec("user.todocomment")
spec("user.colorizer")
spec("user.zenmode")
spec("user.flash")
spec("user.neoscroll")
spec("user.neoclip")
spec("user.neotab")
spec("user.neogit")

-- LOADER
require("user.lazy")
