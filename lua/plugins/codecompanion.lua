return { -- lazy.nvim
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"ravitemer/mcphub.nvim",
		},
		enabled = true, -- set to true to enable
		config = function(_, opts)
			require("codecompanion").setup({
				-- NOTE: The log_level is in `opts.opts`
				opts = {
					log_level = "DEBUG", -- or "TRACE"
				},
				strategies = {
					chat = {
						adapter = {
							name = "copilot",
							model = "gpt-5-mini",
						},
						roles = {
							user = "dan",
						},
						keymaps = {
							send = {
								modes = {
									i = { "<C-CR>", "<C-s>" },
								},
							},
							completion = {
								modes = {
									i = "<C-x>",
								},
							},
						},
						slash_commands = {
							["buffer"] = {
								keymaps = {
									modes = {
										i = "<C-b>",
									},
								},
								opts = {
									provider = "snacks",
								},
							},
							["fetch"] = {
								keymaps = {
									modes = {
										i = "<C-f>",
									},
								},
							},
							["file"] = {
								opts = {
									provider = "snacks",
								},
							},
							["help"] = {
								opts = {
									provider = "snacks",
									max_lines = 1000,
								},
							},
							["image"] = {
								keymaps = {
									modes = {
										i = "<C-i>",
									},
								},
							},
						},
					},
					inline = {
						adapter = {
							name = "copilot",
							model = "gpt-4.1",
						},
					},
				},
				-- extensions = {
				-- 	mcphub = {
				-- 		callback = "mcphub.extensions.codecompanion",
				-- 		opts = {
				-- 			-- MCP Tools
				-- 			make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
				-- 			show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
				-- 			add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
				-- 			show_result_in_chat = true, -- Show tool results directly in chat buffer
				-- 			format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
				-- 			-- MCP Resources
				-- 			make_vars = true, -- Convert MCP resources to #variables for prompts
				-- 			-- MCP Prompts
				-- 			make_slash_commands = true, -- Add MCP prompts as /slash commands
				-- 		},
				-- 	},
				-- },
			})
		end,
		keys = {
			{
				"<leader>c",
				"<cmd>CodeCompanionChat<cr>",
				mode = { "n", "x", "o" },
				desc = "Open CodeCompanion Chat",
			},
			{
				"<leader>a",
				"<cmd>CodeCompanionChat Toggle<cr>",
				mode = { "n", "x", "o" },
				desc = "Open CodeCompanion Chat",
			},
		},
	},
}
