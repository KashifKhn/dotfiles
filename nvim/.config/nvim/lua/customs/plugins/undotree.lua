local opts = {
	float_diff = true,
	layout = "left_bottom",
	position = "left",
	ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
	window = {
		winblend = 30,
	},
	keymaps = {
		["j"] = "move_next",
		["k"] = "move_prev",
		["gj"] = "move2parent",
		["J"] = "move_change_next",
		["K"] = "move_change_prev",
		["<cr>"] = "action_enter",
		["p"] = "enter_diffbuf",
		["q"] = "quit",
	},
}

return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("undotree").setup(opts)
	end,
	keys = {
		{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
	},
}
