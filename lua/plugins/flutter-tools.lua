return {
	{
		"nvim-flutter/flutter-tools.nvim",
    ft = {'dart', 'yaml'},
		keys = {
			{
				"<leader>ds",
				mode = { "n" },
				function()
					local pw = vim.fn.getenv("MAC_PW")
					local user = vim.fn.getenv("MAC_USER")
					local host = vim.fn.getenv("MAC_HOST")
					if not pw then
						vim.notify("MAC_PW environment variable not set", vim.log.levels.ERROR)
						return
					end
					if not user or not host then
						vim.notify("MAC_USERNAME or MAC_HOST environment variables not set", vim.log.levels.ERROR)
						return
					end
					local current_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					local cmd = string.format(
						'rsync -avz --delete -R -e \'sshpass -p %s ssh -v -o StrictHostKeyChecking=no\' "%s/" "%s@%s:/Users/%s/sync/%s"',
						pw,
						'.',
						user,
						host,
						user,
						current_dir
					)
					
					-- Execute command and capture output
					local output = vim.fn.system(cmd)
					local exit_code = vim.v.shell_error
					
					if exit_code ~= 0 then
						vim.notify("Sync failed:\n" .. output, vim.log.levels.ERROR)
					else
						vim.notify("Sync completed successfully", vim.log.levels.INFO)
					end
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
