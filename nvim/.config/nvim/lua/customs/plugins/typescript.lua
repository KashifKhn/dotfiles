return {
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function()
			require("typescript-tools").setup({
				settings = {
					separate_diagnostic_server = false,
					publish_diagnostic_on = "insert_leave",
					expose_as_code_action = "all",
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("typescript-tools-lsp", { clear = true }),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if not client then
						return
					end

					if not client.name == "typescript-tools" then
						return
					end

					local buf_ft = vim.bo[event.buf].filetype
					if
						buf_ft == "typescript"
						or buf_ft == "typescriptreact"
						or buf_ft == "javascript"
						or buf_ft == "javascriptreact"
					then
						local map = function(keys, func, desc)
							vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
						end

						local actions = {
							"Organize Imports",
							"Sort Imports",
							"Remove Unused Imports",
							"Remove Unused Statements",
							"Add Missing Imports",
							"Fix All Errors",
							"Go to Source Definition",
							"Rename File",
							"File References",
						}

						local numbered_actions = {}
						for i, action in ipairs(actions) do
							table.insert(numbered_actions, string.format("%d. %s", i, action))
						end

						map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")

						map("<leader>cA", function()
							vim.ui.select(numbered_actions, {
								prompt = "TypeScript Actions:",
							}, function(choice)
								if not choice then
									return
								end
								local action_num = tonumber(choice:match("^(%d+)"))
								if action_num then
									if action_num == 1 then
										vim.cmd("TSToolsOrganizeImports")
									elseif action_num == 2 then
										vim.cmd("TSToolsSortImports")
									elseif action_num == 3 then
										vim.cmd("TSToolsRemoveUnusedImports")
									elseif action_num == 4 then
										vim.cmd("TSToolsRemoveUnused")
									elseif action_num == 5 then
										vim.cmd("TSToolsAddMissingImports")
									elseif action_num == 6 then
										vim.cmd("TSToolsFixAll")
									elseif action_num == 7 then
										vim.cmd("TSToolsGoToSourceDefinition")
									elseif action_num == 8 then
										vim.cmd("TSToolsRenameFile")
									elseif action_num == 9 then
										vim.cmd("TSToolsFileReferences")
									end
								else
									for _, action in ipairs(actions) do
										if choice == action then
											if action == "Organize Imports" then
												vim.cmd("TSToolsOrganizeImports")
											elseif action == "Sort Imports" then
												vim.cmd("TSToolsSortImports")
											elseif action == "Remove Unused Imports" then
												vim.cmd("TSToolsRemoveUnusedImports")
											elseif action == "Remove Unused Statements" then
												vim.cmd("TSToolsRemoveUnused")
											elseif action == "Add Missing Imports" then
												vim.cmd("TSToolsAddMissingImports")
											elseif action == "Fix All Errors" then
												vim.cmd("TSToolsFixAll")
											elseif action == "Go to Source Definition" then
												vim.cmd("TSToolsGoToSourceDefinition")
											elseif action == "Rename File" then
												vim.cmd("TSToolsRenameFile")
											elseif action == "File References" then
												vim.cmd("TSToolsFileReferences")
											end
											break
										end
									end
								end
							end)
						end, "TypeScript Actions Menu")
					end
				end,
			})
		end,
	},
}
