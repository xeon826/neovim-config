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
				"<cmd>Legendary<cr>",
				mode = { "n", "x", "o" },
				desc = "Jump forwards",
			},
			{
				"s",
				function()
					require("flash").jump()
				end,
				mode = { "n", "x", "o" },
				desc = "Jump forwards",
			},
			{
				"S",
				function()
					require("flash").jump({ search = { forward = false } })
				end,
				mode = { "n", "x", "o" },
				desc = "Jump backwards",
			},
		},
		-- since legendary.nvim handles all your keymaps/commands,
		-- its recommended to load legendary.nvim before other plugins
		priority = 10000,
		lazy = false,
		config = function(_, opts)
			require("legendary").setup({ extensions = { lazy_nvim = true } })
		end,
		dependencies = {
			{
				"folke/flash.nvim",
				event = "VeryLazy",
				---@type Flash.Config
				opts = {},
				keys = {
					{
						"s",
						mode = { "n", "x", "o" },
						function()
							require("flash").jump()
						end,
						desc = "Flash",
					},
					{
						"S",
						mode = { "n", "x", "o" },
						function()
							require("flash").treesitter()
						end,
						desc = "Flash Treesitter",
					},
					{
						"r",
						mode = "o",
						function()
							require("flash").remote()
						end,
						desc = "Remote Flash",
					},
					{
						"R",
						mode = { "o", "x" },
						function()
							require("flash").treesitter_search()
						end,
						desc = "Treesitter Search",
					},
					{
						"<c-s>",
						mode = { "c" },
						function()
							require("flash").toggle()
						end,
						desc = "Toggle Flash Search",
					},
				},
			},
		},
	},
}
