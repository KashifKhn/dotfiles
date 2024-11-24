return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	dependencies = {
		"mfussenegger/nvim-dap", -- Debugging support
		"hrsh7th/cmp-nvim-lsp", -- Completion support
	},
	config = function()
		local home = os.getenv("HOME")
		local jdtls = require("jdtls")
		print("JDTLS Loaded") -- Add this
		local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
		local root_dir = require("jdtls.setup").find_root(root_markers)

		local config = {
			cmd = {
				"java",
				"-javaagent:/home/zarqan-khn/.local/share/nvim/mason/packages/jdtls/lombok.jar",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xms1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				vim.fn.glob(
					"/home/zarqan-khn/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.1200.v20240924-2302.jar"
				),
				"-configuration",
				"/home/zarqan-khn/.local/share/nvim/mason/packages/jdtls/config_linux/config.ini",
				"-data",
				home .. "/.cache/jdtls/workspace", -- Workspace directory
			},
			root_dir = root_dir,
			settings = {
				java = {
					annotations = { annotationProcessing = { enabled = true } },
					configuration = {
						runtimes = {
							{
								name = "JavaSE-21",
								path = "/usr/lib/jvm/java-21-openjdk", -- Java 21 path
							},
						},
					},
				},
			},
			init_options = {
				bundles = {}, -- Optional bundles for debugging or additional tools
			},
		}

		-- Attach to JDTLS when opening a Java file
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				jdtls.start_or_attach(config)
			end,
		})
	end,
}
