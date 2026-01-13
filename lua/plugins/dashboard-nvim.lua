local header = {
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀",
	"⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀",
	"⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀",
	"⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀",
	"⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀",
	"⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀",
	"⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀",
	"⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀",
	"⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀",
	"⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀",
	"⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}
return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					header = header,
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
							desc = "New Blank Buffer",
							group = "Label",
							action = function()
								vim.cmd("enew")
							end,
							key = "b",
						},
						{
							desc = "Find Files (Fzf)",
							group = "Label",
							action = function()
								require("fzf-lua").files()
							end,
							key = "f",
						},
						{
							desc = "Live Grep",
							group = "Label",
							action = function()
								require("fzf-lua").live_grep()
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
						{
							desc = "Session Picker",
							group = "Label",
							action = function()
								vim.cmd("AutoSession search")
							end,
							key = "s",
						},
						{
							desc = "Claude Code",
							group = "Label",
							action = function()
								-- Use pcall to safely call ClaudeCode command
								local ok, _ = pcall(vim.cmd, "ClaudeCode")
								if not ok then
									vim.notify("ClaudeCode not available yet. Try again after plugins load.", vim.log.levels.WARN)
								end
							end,
							key = "c",
						},
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
