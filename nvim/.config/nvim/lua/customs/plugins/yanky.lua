return {
	{
		"gbprod/yanky.nvim",
		recommended = true,
		desc = "Better Yank/Paste",
		opts = {
			highlight = { timer = 150 },
		},
		keys = {
			{
				"<leader>p",
				function()
					if pcall(require, "telescope") then
						require("telescope").extensions.yank_history.yank_history({})
					else
						vim.cmd([[YankyRingHistory]])
					end
				end,
				mode = { "n", "x" },
				desc = "Open Yank History",
			},
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },
		},
	},
}
