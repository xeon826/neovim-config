return {
	{
		"nvim-flutter/flutter-tools.nvim",
    ft = {'dart', 'yaml'},
    enabled=true,
		keys = {
			{
				"<leader>sp", -- sync push
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
					
					-- Create remote directory if it doesn't exist
					local mkdir_cmd = string.format(
						'sshpass -p %s ssh -o StrictHostKeyChecking=no %s@%s "mkdir -p /Users/%s/sync"',
						pw,
						user,
						host,
						user
					)
					vim.fn.system(mkdir_cmd)
					
					-- Push to remote
					local cmd = string.format(
						'rsync -avz --delete -R -e \'sshpass -p %s ssh -o StrictHostKeyChecking=no\' "%s/" "%s@%s:/Users/%s/sync/%s/"',
						pw,
						'.',
						user,
						host,
						user,
						current_dir
					)
					
					vim.notify("Pushing to remote...", vim.log.levels.INFO)
					local output = vim.fn.system(cmd)
					local exit_code = vim.v.shell_error
					
					if exit_code ~= 0 then
						vim.notify("Push failed:\n" .. output, vim.log.levels.ERROR)
					else
						vim.notify("Push completed successfully", vim.log.levels.INFO)
					end
				end,
				desc = "Sync push to remote",
			},
			{
				"<leader>sl", -- sync pull
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
					
					-- Pull from remote
					local cmd = string.format(
						'rsync -avz --delete -R -e \'sshpass -p %s ssh -o StrictHostKeyChecking=no\' "%s@%s:/Users/%s/sync/%s/" "%s"',
						pw,
						user,
						host,
						user,
						current_dir,
						'.'
					)
					
					vim.notify("Pulling from remote...", vim.log.levels.INFO)
					local output = vim.fn.system(cmd)
					local exit_code = vim.v.shell_error
					
					if exit_code ~= 0 then
						vim.notify("Pull failed:\n" .. output, vim.log.levels.ERROR)
					else
						vim.notify("Pull completed successfully", vim.log.levels.INFO)
					end
				end,
				desc = "Sync pull from remote",
			},
    },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
	},
}
