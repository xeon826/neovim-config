local utils = require("config/utils")
-- nvim v0.8.0
return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	keys = {
		{ mode = "n", "<leader>gch", utils.my_git_bcommits, desc = "Find Files" },
		{ "<C-g>", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
	opts = {
		-- Set fzf-lua as the default picker
		picker = "fzf-lua",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

