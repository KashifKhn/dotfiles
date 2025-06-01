return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		dir = "/home/zarqan-khn/mycoding/myprojects/nvim-remove-comments",
		name = "nvim-remove-comments",
		lazy = false,
		priority = 1000,
	},
}
