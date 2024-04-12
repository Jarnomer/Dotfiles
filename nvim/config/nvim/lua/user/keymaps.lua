local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<Space>", "", opts)

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "J", "mzJ`z")

keymap("x", "p", [["_dP]])
keymap("v", "p", '"_dPUp')
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)

keymap("v", "<S-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- indent and de-indent in visual mode
keymap("v", ">", "<gv", opts)
keymap("v", "<", ">gv", opts)

keymap({ "n", "o", "x" }, "<S-h>", "^", opts)
keymap({ "n", "o", "x" }, "<S-l>", "g_", opts)

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Exclusive arrow keymaps for Sweep Ferris
-- Scrolling motions are defined in Neoscroll

-- Win + Arrows (All) | Switch windows (Normal)
keymap("n", "<D-Right>", "<C-w>l", opts)
keymap("n", "<D-Down>", "<C-w>j", opts)
keymap("n", "<D-Up>", "<C-w>k", opts)
keymap("n", "<D-Left>", "<C-w>h", opts)

-- Win + Crtl + Arrows (All) | Resize windows (Normal)
keymap("n", "<C-D-Right>", ":vertical resize -8<CR>", opts)
keymap("n", "<C-D-Down>", ":horizontal resize +5<CR>", opts)
keymap("n", "<C-D-Up>", ":horizontal resize -5<CR>", opts)
keymap("n", "<C-D-Left>", ":vertical resize +8<CR>", opts)

-- Shift + Arrows (Left/Right) | Normal w/b commands (All)
keymap({ "n", "o", "x" }, "<S-Right>", "w", opts)
keymap({ "n", "o", "x" }, "<S-Left>", "b", opts)

-- Crtl + Arrows (Left/Right) | Normal W/B commands (All)
keymap({ "n", "o", "x" }, "<C-Right>", "W", opts)
keymap({ "n", "o", "x" }, "<C-Left>", "B", opts)

-- Crtl + Shift + Arrows (Left/Right) | Normal e/E commands (All)
keymap({ "n", "o", "x" }, "<C-S-Right>", "e", opts)
keymap({ "n", "o", "x" }, "<C-S-Left>", "E", opts)

-- Alt + Arrows (Up/Down) | Move selection up/down (Visual)
keymap("v", "<M-Down>", ":m '>+1<CR>gv=gv")
keymap("v", "<M-Up>", ":m '<-2<CR>gv=gv")

-- Alt + Arrows (Left/Right) | Start/End of line (All)
keymap({ "n", "o", "x" }, "<M-Left>", "^", opts)
keymap({ "n", "o", "x" }, "<M-Right>", "g_", opts)
