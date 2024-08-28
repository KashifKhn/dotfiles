vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" }) -- Add any additional keymaps here
keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
keymap.set("n", "<leader>ww", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

--- Undo tree keymaps
keymap.set("n", "<leader>z", require("undotree").toggle, { noremap = true, silent = true })
