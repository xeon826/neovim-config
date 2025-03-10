return {
	{
		"nvim-flutter/flutter-tools.nvim",
    ft = {'dart', 'yaml'},
    enabled=false,
    init = function()
      -- Create autocommand group
      local group = vim.api.nvim_create_augroup("MacSync", { clear = true })
      
      -- Add autocommand for BufWritePost
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        pattern = "*",
        callback = function()
          local current_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          local file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")  -- Get relative path of current file
          
          -- Only sync if file is within current working directory
          if vim.fn.match(file_path, "^%.%.") == -1 then
            -- Create remote directory structure
            local remote_dir = vim.fn.fnamemodify(file_path, ":h")
            if remote_dir ~= "." then
              vim.fn.system(string.format('ssh mac "mkdir -p /Users/administrator/sync/%s/%s"', current_dir, remote_dir))
            end
            
            -- Sync single file
            local cmd = string.format(
              'rsync -az "%s" "mac:/Users/administrator/sync/%s/%s"',
              file_path,
              current_dir,
              file_path
            )
            
            local output = vim.fn.system(cmd)
            local exit_code = vim.v.shell_error
            
            if exit_code ~= 0 then
              vim.notify("Auto-sync failed:\n" .. output, vim.log.levels.ERROR)
            else
              vim.notify("Auto-sync completed: " .. file_path, vim.log.levels.INFO)
            end
          end
        end,
      })
    end,
		keys = {
			{
				"<leader>sp", -- sync push
				mode = { "n" },
				function()
					local current_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					
					-- Create remote directory if it doesn't exist
					vim.fn.system('ssh mac "mkdir -p /Users/administrator/sync"')
					
					-- Push to remote
					local cmd = string.format(
						'rsync -avz --delete -R "%s/" "mac:/Users/administrator/sync/%s/"',
						'.',
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
					local current_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					
					-- Pull from remote
					local cmd = string.format(
						'rsync -avz --delete -R "mac:/Users/administrator/sync/%s/" "%s"',
						current_dir,
						'.'
					)
					
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
