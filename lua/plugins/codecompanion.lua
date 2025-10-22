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
						inline = {
							keymaps = {
								accept_change = { modes = { n = "ga" } },
								reject_change = { modes = { n = "gr" } },
								always_accept = { modes = { n = "gy" } },
							},
						},
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
			vectorcode = {
				---@type VectorCode.CodeCompanion.ExtensionOpts
				opts = {
					tool_group = {
						enabled = true,
						extras = {},
						collapse = false,
					},
					tool_opts = {
						["*"] = {},
						ls = {},
						vectorise = {},
						query = {
							max_num = { chunk = -1, document = -1 },
							default_num = { chunk = 50, document = 10 },
							include_stderr = false,
							use_lsp = false,
							no_duplicate = true,
							chunk_mode = false,
							summarise = {
								enabled = false,
								adapter = nil,
								query_augmented = true,
							},
						},
						files_ls = {},
						files_rm = {},
					},
				},
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
			history = {
				enabled = true,
				opts = {
					keymap = "gh",
					save_chat_keymap = "sc",
					auto_save = true,
					expiration_days = 0,
					picker = "fzf-lua", --- ("telescope", "snacks", "fzf-lua", or "default")
					chat_filter = nil,
					picker_keymaps = {
						rename = { n = "r", i = "<M-r>" },
						delete = { n = "d", i = "<M-d>" },
						duplicate = { n = "<C-y>", i = "<C-y>" },
					},
					auto_generate_title = true,
					title_generation_opts = {
						adapter = nil,
						model = nil,
						refresh_every_n_prompts = 0,
						max_refreshes = 3,
						format_title = function(original_title)
							return original_title
						end,
					},
					continue_last_chat = false,
					delete_on_clearing_chat = false,
					dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
					enable_logging = false,
					summary = {
						create_summary_keymap = "gcs",
						browse_summaries_keymap = "gbs",
						generation_opts = {
							adapter = nil,
							model = nil,
							context_size = 90000,
							include_references = true,
							include_tool_outputs = true,
							system_prompt = nil,
							format_summary = nil,
						},
					},
					memory = {
						auto_create_memories_on_summary_generation = true,
						vectorcode_exe = "vectorcode",
						tool_opts = {
							default_num = 10,
						},
						notify = true,
						index_on_startup = false,
					},
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
		"Davidyz/VectorCode",
		{
			"ravitemer/mcphub.nvim",
			build = "/usr/bin/npm install -g mcp-hub@latest",
			config = {
				global_env = {
					"GITHUB_PERSONAL_ACCESS_TOKEN",
					"FIRECRAWL_API_KEY",
				},
			},
		},
	},
}
