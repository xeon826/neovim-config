return {
	"olimorris/codecompanion.nvim",
	event = "VeryLazy",
	opts = {
		opts = {
			log_level = "DEBUG",
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
			spinner = {},
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
			config = true,
		},
	},
}
