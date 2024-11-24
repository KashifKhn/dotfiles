-- local map = function(keys, func, desc, mode, buffer)
-- 	mode = mode or "n"
-- 	buffer = buffer or 0
-- 	desc = desc or ""
-- 	vim.keymap.set(mode, keys, func, { buffer = buffer, desc =  desc })
-- end
--
-- map("jj", "<Esc>", "Exit insert mode", "i")
-- map("<leader>e", ":Explore <CR>", "Neovim Explore", "n")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<Space>", "<Nop>", { desc = "Disable space moving the cursor" })
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode", remap = true })
-- keymap.set("n", "<leader>e", ":Explore <CR>", { desc = "Explore" })
keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap.set("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
keymap.set("n", "<leader>wj", "<C-W>j", { desc = "Move to window below", remap = true })
keymap.set("n", "<leader>wk", "<C-W>k", { desc = "Move to window above", remap = true })
keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Move to window left", remap = true })
keymap.set("n", "<leader>wl", "<C-W>l", { desc = "Move to window right", remap = true })

keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Disable arrow keys in all modes
-- keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>", { desc = "Disable Up Arrow" })
-- keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>", { desc = "Disable Down Arrow" })
-- keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>", { desc = "Disable Left Arrow" })
-- keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>", { desc = "Disable Right Arrow" })
