return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = {
						name = "opencode",
						model = "zai-coding-plan/glm-4.7",
					},
					keymaps = {
						send = {
							modes = {
								i = { "<C-CR>", "<C-s>" },
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
					},
				},
				inline = {
					adapter = {
						name = "opencode",
						model = "zai-coding-plan/glm-4.7",
					},
				},
			},
		})
	end,
	keys = {
		{
			"<C-\\>",
			"<cmd>CodeCompanionChat<cr>",
			mode = { "n", "x", "o" },
			desc = "Open CodeCompanion Chat",
		},
		{
			"<leader>cc",
			"<cmd>CodeCompanionChat<cr>",
			mode = { "n", "x", "o" },
			desc = "Open CodeCompanion Chat",
		},
		{
			"<leader>ca",
			"<cmd>CodeCompanionChat Toggle<cr>",
			mode = { "n", "x", "o" },
			desc = "Toggle CodeCompanion Chat",
		},
	},
}
