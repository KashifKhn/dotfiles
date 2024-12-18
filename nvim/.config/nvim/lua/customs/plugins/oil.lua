return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			view_options = {
				show_hidden = true, -- Enable showing hidden files
			},
		})
		vim.keymap.set("n", "<leader>-", oil.toggle_float, {})
	end,
}
