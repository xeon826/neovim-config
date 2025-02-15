return {
	{
		"anongecko/keywhiz.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		cmd = "Keymaps",
		keys = {
			{ "<leader>sk", "<cmd>Telescope keywhiz<cr>", desc = "Search Keymaps" },
		},
		opts = {
			-- your configuration options
		},
	},
}
