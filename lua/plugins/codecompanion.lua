return {
	"olimorris/codecompanion.nvim",
	event = "VeryLazy",
	opts = {
		opts = {
			log_level = "DEBUG",
		},

		strategies = {
			chat = {
				roles = {
					user = "dan the man",
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
		},
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
					make_tools = true,
					show_server_tools_in_chat = true,
				},
			},
		},
	},
	keys = {
		{
			"<leader>a",
			"<cmd>CodeCompanionChat Toggle<CR>",
			mode = { "n" },
			desc = "Toggle CodeCompanion Chat",
			noremap = true,
			silent = true,
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"franco-ruggeri/codecompanion-spinner.nvim",
		"ravitemer/codecompanion-history.nvim",
		{
			"ravitemer/mcphub.nvim",
			build = "/usr/bin/npm install -g mcp-hub@latest",
			config = {
				global_env = {
					GITHUB_PERSONAL_ACCESS_TOKEN = os.getenv("GITHUB_PERSONAL_ACCESS_TOKEN"),
				},
			},
		},
	},
}
