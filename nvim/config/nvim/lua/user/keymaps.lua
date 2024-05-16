local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Assign space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<Space>", "", opts)

-- Center view when command is triggered
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
keymap("n", "{", "{zz")
keymap("n", "}", "}zz")
keymap("n", "J", "mzJ`z")

keymap("x", "p", [["_dP]])
keymap("v", "p", '"_dPUp')
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)

-- Move selected lines up or down
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- Indent and de-indent in visual mode
keymap("v", ">", "<gv", opts)
keymap("v", "<", ">gv", opts)

-- Move to end or start of line
keymap({ "n", "o", "x" }, "<S-h>", "^", opts)
keymap({ "n", "o", "x" }, "<S-l>", "g_", opts)

-- Disable highlight in normal mode
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Sweep Ferris Navigation

-- Cmd + Arrows (All) | Switch windows (Normal Mode)
keymap("n", "<D-Right>", "<C-w>l", opts)
keymap("n", "<D-Down>", "<C-w>j", opts)
keymap("n", "<D-Up>", "<C-w>k", opts)
keymap("n", "<D-Left>", "<C-w>h", opts)

-- Cmd + Alt + Arrows (All) | Resize windows (Normal Mode)
keymap("n", "<D-M-Right>", ":vertical resize -10<CR>", opts)
keymap("n", "<D-M-Down>", ":horizontal resize +5<CR>", opts)
keymap("n", "<D-M-Up>", ":horizontal resize -5<CR>", opts)
keymap("n", "<D-M-Left>", ":vertical resize +10<CR>", opts)

-- Alt + Arrows (All) | Start/End of line/document (All Modes)
keymap({ "n", "o", "x" }, "<M-Right>", "g_", opts)
keymap({ "n", "o", "x" }, "<M-Down>", "G", opts)
keymap({ "n", "o", "x" }, "<M-Up>", "gg", opts)
keymap({ "n", "o", "x" }, "<M-Left>", "^", opts)

-- Shift / Crtl + Arrows (All) | Normal w(W)/b(B) commands (All Modes)
keymap({ "n", "o", "x" }, "<S-Right>", "w", opts)
keymap({ "n", "o", "x" }, "<C-Right>", "W", opts)
keymap({ "n", "o", "x" }, "<S-Left>", "b", opts)
keymap({ "n", "o", "x" }, "<C-Left>", "B", opts)
