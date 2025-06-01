return {
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({
				lsp = {
					autostart = true,
					on_attach = function(client, bufnr)
						client.server_capabilities.hoverProvider = true
					end,
					color = {
						enabled = true,
					},
					settings = {
						dart = {
							analysisExcludedFolders = { vim.fn.expand("~/.pub-cache") },
						},
					},
				},
			})
		end,
	},
}
