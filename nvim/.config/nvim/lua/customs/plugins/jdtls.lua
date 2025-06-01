return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	dependencies = {
		"mfussenegger/nvim-dap",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {},
	config = function()
		local jdtls = require("jdtls")

		local home = os.getenv("HOME")
		local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

		local config = {
			cmd = {
				"jdtls",
				"-data",
				workspace_folder,
			},
			root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "build.gradle", "pom.xml" }),
		}

		jdtls.start_or_attach(config)
	end,
}
