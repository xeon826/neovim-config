return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		enabled = "true",
		build = "make tiktoken",
		config = function(_, opts)
			require("CopilotChat").setup(opts)
		end,
		opts = {
			model = "claude-3.5-sonnet", -- AI model to use
			temperature = 0.1, -- Lower = focused, higher = creative
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
					chat.toggle({ window = { layout = "float" } })
				end,
				desc = "Toggle Copilot Float",
			},
			{
				"<leader>av",
				mode = { "n", "x", "o" },
				function()
					local chat = require("CopilotChat")
					chat.toggle({ window = { layout = "vertical" } })
				end,
				desc = "Toggle Copilot Vertical",
			},
			{
				"<leader>ah",
				mode = { "n", "x", "o" },
				function()
					local chat = require("CopilotChat")
					chat.toggle({ window = { layout = "horizontal" } })
				end,
				desc = "Toggle Copilot Horizontal",
			},
		},
	},
}
