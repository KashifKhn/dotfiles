return {
	"echasnovski/mini.surround",
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
}
