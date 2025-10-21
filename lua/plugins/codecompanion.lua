-- local env_path = vim.fn.getcwd() .. "/.env"
-- local function load_env_file(path)
-- 	local loaded = {}
-- 	local file = io.open(path, "r")
-- 	if not file then
-- 		return loaded
-- 	end
-- 	for line in file:lines() do
-- 		local key, value = line:match("^%s*([%w_]+)%s*=%s*(.+)%s*$")
-- 		if key and value then
-- 			vim.fn.setenv(key, value)
-- 			loaded[key] = value
-- 		end
-- 	end
-- 	file:close()
-- 	return loaded
-- end

-- local loaded_env = load_env_file(env_path)
-- print(vim.inspect(loaded_env))
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
			history = {
				enabled = true,
				opts = {
					-- Keymap to open history from chat buffer (default: gh)
					keymap = "gh",
					-- Keymap to save the current chat manually (when auto_save is disabled)
					save_chat_keymap = "sc",
					-- Save all chats by default (disable to save only manually using 'sc')
					auto_save = true,
					-- Number of days after which chats are automatically deleted (0 to disable)
					expiration_days = 0,
					-- Picker interface (auto resolved to a valid picker)
					picker = "fzf-lua", --- ("telescope", "snacks", "fzf-lua", or "default")
					---Optional filter function to control which chats are shown when browsing
					chat_filter = nil, -- function(chat_data) return boolean end
					-- Customize picker keymaps (optional)
					picker_keymaps = {
						rename = { n = "r", i = "<M-r>" },
						delete = { n = "d", i = "<M-d>" },
						duplicate = { n = "<C-y>", i = "<C-y>" },
					},
					---Automatically generate titles for new chats
					auto_generate_title = true,
					title_generation_opts = {
						---Adapter for generating titles (defaults to current chat adapter)
						adapter = nil, -- "copilot"
						---Model for generating titles (defaults to current chat model)
						model = nil, -- "gpt-4o"
						---Number of user prompts after which to refresh the title (0 to disable)
						refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
						---Maximum number of times to refresh the title (default: 3)
						max_refreshes = 3,
						format_title = function(original_title)
							-- this can be a custom function that applies some custom
							-- formatting to the title.
							return original_title
						end,
					},
					---On exiting and entering neovim, loads the last chat on opening chat
					continue_last_chat = false,
					---When chat is cleared with `gx` delete the chat from history
					delete_on_clearing_chat = false,
					---Directory path to save the chats
					dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
					---Enable detailed logging for history extension
					enable_logging = false,

					-- Summary system
					summary = {
						-- Keymap to generate summary for current chat (default: "gcs")
						create_summary_keymap = "gcs",
						-- Keymap to browse summaries (default: "gbs")
						browse_summaries_keymap = "gbs",

						generation_opts = {
							adapter = nil, -- defaults to current chat adapter
							model = nil, -- defaults to current chat model
							context_size = 90000, -- max tokens that the model supports
							include_references = true, -- include slash command content
							include_tool_outputs = true, -- include tool execution results
							system_prompt = nil, -- custom system prompt (string or function)
							format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
						},
					},

					-- Memory system (requires VectorCode CLI)
					memory = {
						-- Automatically index summaries when they are generated
						auto_create_memories_on_summary_generation = true,
						-- Path to the VectorCode executable
						vectorcode_exe = "vectorcode",
						-- Tool configuration
						tool_opts = {
							-- Default number of memories to retrieve
							default_num = 10,
						},
						-- Enable notifications for indexing progress
						notify = true,
						-- Index all existing memories on startup
						-- (requires VectorCode 0.6.12+ for efficient incremental indexing)
						index_on_startup = false,
					},
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
					"GITHUB_PERSONAL_ACCESS_TOKEN",
					"FIRECRAWL_API_KEY",
				},
			},
		},
	},
}
