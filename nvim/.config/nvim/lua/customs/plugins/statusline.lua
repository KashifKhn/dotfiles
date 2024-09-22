return {
	{
		"tjdevries/express_line.nvim",
		config = function()
			require("customs.statusline").setup()
		end,
	},
}
