require("fzf-lua").register_ui_select()
return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		enabled = "true",
		build = "make tiktoken",
		config = function()
			require("CopilotChat").setup({
				prompts = {
					Fix = {
						prompt = "#diagnostics:current #buffer why am I getting this/these error(s)?",
						system_prompt = "You are very good at explaining stuff",
						mapping = "<leader>cpf",
						description = "Fix the issue in the current buffer while taking into account the diagnostics.",
					},
					WithListedFix = {
						prompt = "#diagnostics:current #buffers:listed why am I getting this/these error(s)?",
						system_prompt = "You are very good at explaining stuff",
						mapping = "<leader>cpw",
						description = "Fix the issue in the current buffer while taking into account the diagnostics as well as all listed buffers.",
					},
				},
			})
		end,
		opts = {
			model = "gpt-4.1", -- AI model to use
			temperature = 0.1, -- Lower = focused, higher = creative
			window = {
				width = 0.5, -- 50% of screen width
				layout = "vertical",
				height = 20, -- Fixed height in rows
				border = "rounded", -- 'single', 'double', 'rounded', 'solid'
				title = "🤖 AI Assistant",
				zindex = 100, -- Ensure window stays on top
			},
			headers = {
				user = "👤 You",
				assistant = "🤖 Copilot",
				tool = "🔧 Tool",
			},
			separator = "━━",
			auto_fold = true, -- Automatically folds non-assistant messages
			auto_insert_mode = true, -- Enter insert mode when opening
		},
		keys = {
			{
				"<leader>a",
				mode = { "n", "x", "o" },
				function()
					local chat = require("CopilotChat")
					chat.toggle(config)
				end,
				desc = "Toggle Copilot",
			},
			{
				"<leader>cpr",
				mode = { "n", "x", "o" },
				function()
					local chat = require("CopilotChat")
					chat.reset()
				end,
				desc = "Reset Copilot Chat",
			},
			{
				"<leader>cpa",
				mode = { "n", "x", "o" },
				function()
					local chat = require("CopilotChat")
					chat.select_prompt(config)
				end,
				desc = "Reset Copilot Chat",
			},
		},
	},
}
