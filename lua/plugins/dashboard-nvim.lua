return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					shortcut = {
						{
							desc = "Explorer (nvim-tree)",
							group = "Label",
							action = function()
								require("nvim-tree.api").tree.toggle()
							end,
							key = "e",
						},
						{
							desc = "Find Files (Telescope)",
							group = "Label",
							action = function()
								require("telescope.builtin").find_files()
							end,
							key = "f",
						},
						{
							desc = "Live Grep",
							group = "Label",
							action = function()
								require("telescope.builtin").live_grep()
							end,
							key = "/",
						},
						{
							desc = "Lazygit",
							group = "Label",
							action = function()
								vim.cmd("LazyGit")
							end,
							key = "g",
						},
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
