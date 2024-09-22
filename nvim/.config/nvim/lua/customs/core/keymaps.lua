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

keymap.set("n", "<Space>", "<Nop>", {desc = "Disable space moving the cursor"})
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
keymap.set("i", "jj", "<Esc>", {desc = "Exit insert mode"} )
keymap.set("n", "<leader>e", ":Explore <CR>", {desc = "Explore"})

