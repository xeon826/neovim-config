return { -- lazy.nvim
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			-- NOTE: The log_level is in `opts.opts`
			opts = {
				log_level = "DEBUG", -- or "TRACE"
			},
		},
		keys = {
			{
				"<leader>a",
        "<cmd>CodeCompanionChat<cr>",
				mode = { "n", "x", "o" },
				desc = "Open CodeCompanion Chat",
			},
			{
				"<leader>c",
        "<cmd>CodeCompanionChat Toggle<cr>",
				mode = { "n", "x", "o" },
				desc = "Open CodeCompanion Chat",
			},
		},
	},
}
