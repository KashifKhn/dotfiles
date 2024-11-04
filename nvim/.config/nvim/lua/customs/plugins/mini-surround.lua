return {
	"echasnovski/mini.surround",
	recommended = true,
	keys = {
		-- Directly define the keys if you are not dynamically extending them
		{ "gsa", desc = "Add Surrounding", mode = { "n", "v" } },
		{ "gsd", desc = "Delete Surrounding" },
		{ "gsr", desc = "Replace Surrounding" },
		-- Uncomment these if you want them enabled
		-- { "gsf", desc = "Find Right Surrounding" },
		-- { "gsF", desc = "Find Left Surrounding" },
		-- { "gsh", desc = "Highlight Surrounding" },
		-- { "gsn", desc = "Update `n_lines`" },
	},
	opts = {
		mappings = {
			add = "gsa", -- Add surrounding in Normal and Visual modes
			delete = "gsd", -- Delete surrounding
			replace = "gsr", -- Replace surrounding
			-- Uncomment these if needed
			-- find = "gsf", -- Find surrounding (to the right)
			-- find_left = "gsF", -- Find surrounding (to the left)
			-- highlight = "gsh", -- Highlight surrounding
			-- update_n_lines = "gsn", -- Update `n_lines`
		},
	},
}
