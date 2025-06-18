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
		local lombok_path = home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar"

		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-javaagent:" .. lombok_path,
				"-Xms1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				vim.fn.glob(
					home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
				),
				"-configuration",
				home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
				"-data",
				workspace_folder,
			},
			root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "build.gradle", "pom.xml" }),
		}

		jdtls.start_or_attach(config)
	end,
}
