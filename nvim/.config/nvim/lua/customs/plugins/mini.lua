return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup({
				recommended = true,
				keys = {
					{ "sa", desc = "Add Surrounding", mode = { "n", "v" } },
					{ "sd", desc = "Delete Surrounding" },
					{ "sr", desc = "Replace Surrounding" },
				},
				opts = {
					mappings = {
						add = "sa",
						delete = "sd",
						replace = "sr",
					},
				},
			})
		end,
	},
}
