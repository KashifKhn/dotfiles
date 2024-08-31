vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" }) -- Add any additional keymaps here
keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

-- adding ctrl + a to select all in both normal and insert mode
keymap.set("i", "<C-a>", "<ESC>ggVG", { silent = true })
keymap.set("n", "<C-a>", "ggVG", { silent = true })

keymap.set("n", "<leader>ww", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- disable ctrl + z
keymap.set("n", "<C-z>", "", {})

--- Undo tree keymaps
keymap.set("n", "<leader>z", require("undotree").toggle, { noremap = true, silent = true })
