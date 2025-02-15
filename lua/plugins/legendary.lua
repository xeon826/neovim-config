return {
	{
		"mrjones2014/legendary.nvim",
		keys = {
			{
				"<leader>la",
				"<cmd>Legendary<cr>",
				mode = { "n", "x", "o" },
				desc = "Jump forwards",
			},
			{
				"<leader>lk",
				"<cmd>Legendary keymaps<cr>",
				mode = { "n", "x", "o" },
				desc = "Jump forwards",
			},
		},
		-- since legendary.nvim handles all your keymaps/commands,
		-- its recommended to load legendary.nvim before other plugins
		priority = 10000,
		lazy = false,
		config = function(_, opts)
			require("legendary").setup({ extensions = { lazy_nvim = true } })
		end,
		dependencies = {},
	},
}
