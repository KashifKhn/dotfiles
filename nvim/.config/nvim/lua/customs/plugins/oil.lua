return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local oil = require("oil")
		oil.setup({
			view_options = {
				show_hidden = true,
			},
		})

		local function toggle_oil()
			if vim.bo.filetype == "oil" then
				vim.cmd("bdelete")
			else
				oil.open()
			end
		end

		vim.keymap.set("n", "<space>-", toggle_oil, { desc = "Toggle Oil" })
	end,
}
