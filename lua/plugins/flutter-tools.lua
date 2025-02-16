return {
	{
		"nvim-flutter/flutter-tools.nvim",
    ft = {'dart', 'yaml'},
		keys = {
			{
				"<leader>ds",
				mode = { "n" },
				function()
					local salt = vim.fn.getenv("SALT")
					if not salt then
						vim.notify("SALT environment variable not set", vim.log.levels.ERROR)
						return
					end
					local cmd = string.format(
						'rsync -avz --delete -e \'sshpass -p %s ssh -o StrictHostKeyChecking=no\' "%s/" "dan@192.168.100.2:/Users/dan/sync/"',
						salt,
						vim.fn.getcwd()
					)
					vim.fn.system(cmd)
					vim.notify("Sync completed", vim.log.levels.INFO)
				end,
				desc = "Sync project to remote",
			},
    },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
	},
}
